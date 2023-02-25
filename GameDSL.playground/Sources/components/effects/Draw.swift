import Foundation

/// Draw top deck card
public struct Draw: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute]

    public init(player: ArgPlayerAttribute = PlayerActor()) {
        self.ctx = ["player": player]
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
