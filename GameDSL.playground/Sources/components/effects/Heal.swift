import Foundation

/// Restore player's health, limited to maxHealth
public struct Heal: Effect {
    public var attr: [String: Attribute]

    public init(_ value: Int, player: ArgPlayerAttribute = PlayerActor()) {
        self.attr = ["value": NumExact(value),
                     "player": player]
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
