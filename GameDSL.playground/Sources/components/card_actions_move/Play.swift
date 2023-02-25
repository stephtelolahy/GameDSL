import Foundation

/// Play a card, discard immediately
public struct Play: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]
    let target: ArgPlayer?
    let content: [CardAction]

    public init(target: ArgPlayer? = nil, @CardActionsBuilder content: () -> [CardAction]) {
        self.target = target
        self.content = content()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
