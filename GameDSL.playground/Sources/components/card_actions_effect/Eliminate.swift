import Foundation

/// Remove player from game
public struct Eliminate: Effect {
    public var ctx: [String: Attribute] = [:]
    let player: ArgPlayer

    public init(player: ArgPlayer = PlayerActor()) {
        self.player = player
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
