import Foundation

/// Restore player's health, limited to maxHealth
public struct Heal: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute]

    public init(_ value: Int, player: ArgPlayerAttribute = PlayerActor()) {
        self.ctx = ["value": NumExact(value),
                     "player": player]
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
