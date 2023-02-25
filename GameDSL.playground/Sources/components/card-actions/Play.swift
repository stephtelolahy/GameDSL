import Foundation

/// Play a card, discard immediately
public struct Play: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var target: ArgPlayer?
    public var ctx: [String: Attribute] = [:]
    let content: [CardAction]

    public init(@CardActionsBuilder content: () -> [CardAction]) {
        self.content = content()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
