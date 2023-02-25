import Foundation

/// Deals damage to a player, attempting to reduce its Health by the stated amount
public struct Damage: Effect {
    public var attr: [String: Attribute]

    public init(_ value: Int, player: ArgPlayerAttribute = PlayerActor()) {
        self.attr = ["value": NumExact(value),
                     "player": player]
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
