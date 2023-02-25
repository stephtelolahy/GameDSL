import Foundation

/// Restore player's health, limited to maxHealth
public struct Heal: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var target: ArgPlayer?
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
