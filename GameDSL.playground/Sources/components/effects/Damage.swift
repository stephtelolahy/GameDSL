import Foundation

/// Deals damage to a player, attempting to reduce its Health by the stated amount
public struct Damage: CardAction {
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
