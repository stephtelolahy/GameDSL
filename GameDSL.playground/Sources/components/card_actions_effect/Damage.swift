import Foundation

/// Deals damage to a player, attempting to reduce its Health by the stated amount
public struct Damage: Effect {
    public var ctx: [String: Attribute] = [:]
    let value: Int
    let player: ArgPlayer

    public init(_ value: Int, player: ArgPlayer = PlayerActor()) {
        self.value = value
        self.player = player
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
