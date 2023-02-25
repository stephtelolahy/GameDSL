import Foundation

/// Set turn
public struct SetTurn: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]
    let player: ArgPlayer

    public init(player: ArgPlayer) {
        self.player = player
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
