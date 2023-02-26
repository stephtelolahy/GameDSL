import Foundation
import Combine

public class EngineImpl: Engine {
    public var state: CurrentValueSubject<Game, Never>
    public var queue: [Event]
    private let delay: DispatchTimeInterval
    private let rule: EngineRule

    public init(
        _ ctx: Game,
        queue: [Event] = [],
        rule: EngineRule,
        delay: DispatchTimeInterval = .seconds(0)
    ) {
        self.state = CurrentValueSubject(ctx)
        self.queue = queue
        self.rule = rule
        self.delay = delay
    }

    public func input(_ move: Event) {
        /// if waiting choice, then validate move
        if let chooseOne = queue.first as? ChooseOne {
            if chooseOne.options.contains(where: { $0.isEqualTo(move) }) {
                queue.remove(at: 0)
            } else {
                return
            }
        }

        /// if queue not empty
        else if !queue.isEmpty {
            fatalError()
        }

        queue.insert(move, at: 0)
        update()
    }

    public func update() {
        _update(state.value)
    }

    // swiftlint:disable:next function_body_length cyclomatic_complexity
    private func _update(_ ctx: Game) {
        var ctx = ctx

        // if game is over
        // then complete
        if ctx.isOver {
            return
        }

        // if waiting choice
        // emit options
        // then complete
        if let chooseOne = queue.first as? ChooseOne {
            ctx.event = .success(chooseOne)
            state.send(ctx)
            return
        }

        // apply cancel if any
        if let cancel = queue.first as? Cancel {
            queue.remove(at: 0)
            queue.remove(at: 0)
            ctx.event = .success(cancel)
            state.send(ctx)
            update()
            return
        }

        // if idle,
        // emit active moves if any
        // then complete
        if queue.isEmpty {
            if let active = rule.active(ctx) {
                ctx.event = .success(Activate(active))
                state.send(ctx)
            }
            return
        }

        // remove previous event
        ctx.event = nil

        // process queue
        let event = queue.remove(at: 0)
        let result = event.resolve(ctx)
        switch result {
        case let .success(output):
            if let update = output.state {
                ctx = update
                ctx.event = .success(event)
            }

            // queue children
            if let children = output.children {
                queue.insert(contentsOf: children, at: 0)
            }

            // push triggered effects if any
            if let triggered = rule.triggered(ctx) {
                queue.insert(contentsOf: triggered, at: 0)
            }

        case let .failure(error):
            ctx.event = .failure(error)
        }

        // emit state only when event occurred
        let emitState = ctx.event != nil
        if emitState {
            state.send(ctx)
        }

        // loop update
        if emitState {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                self?._update(ctx)
            }
        } else {
            _update(ctx)
        }
    }
}

public struct EngineRuleImpl: EngineRule {

    public init() {}

    public func triggered(_ ctx: Game) -> [Event]? {
        /// return matched card options with context
        fatalError()
    }

    public func active(_ ctx: Game) -> [Event]? {
        /// return matched card options with context
        fatalError()
    }
}
