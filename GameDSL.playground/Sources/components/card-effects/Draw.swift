import Foundation

/// Draw top deck card
public struct Draw: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]
    let player: ArgPlayer

    public init(player: ArgPlayer = PlayerActor()) {
        self.player = player
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
