import Foundation

public struct BangRule: CardGameEngineRule {

    public init() {}

    public func triggered(_ ctx: Game) -> [Event]? {
        /// return matched card options with context
        var result: [Event] = []
        for playerObj in ctx.players {
            let triggerableCards: [Card] = playerObj.inPlay + playerObj.abilities
            for cardObj in triggerableCards {
                let events: [Event] = cardObj.actions
                    .filter { $0.type == .triggered && $0.requirements.match(ctx).isSuccess }
                    .map { $0.toEvent(actor: playerObj, card: cardObj) }
                result.append(contentsOf: events)
            }
        }

        guard !result.isEmpty else {
            return nil
        }
        
        return result
    }

    public func active(_ ctx: Game) -> [Event]? {
        /// return matched card options with context
        guard let playerObj = ctx.activePlayer() else {
            return nil
        }

        var result: [Event] = []
        let triggerableCards: [Card] = playerObj.hand + playerObj.abilities
        for cardObj in triggerableCards {
            let events: [Event] = cardObj.actions
                .filter { $0.type == .active && $0.requirements.match(ctx).isSuccess }
                .map { $0.toEvent(actor: playerObj, card: cardObj) }
            result.append(contentsOf: events)
        }

        guard !result.isEmpty else {
            return nil
        }

        return result
    }
}

extension CardAction {
    func toEvent(actor: Player, card: Card) -> Event {
        // TODO: add context (actor, card)
        effect
    }
}

extension Array where Element == Requirement {
    func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}

extension Player {
    var hand: [Card] {
        fatalError()
    }

    var inPlay: [Card] {
        fatalError()
    }

    var abilities: [Card] {
        fatalError()
    }
}

extension Game {
    func activePlayer() -> Player? {
        fatalError()
    }
}
