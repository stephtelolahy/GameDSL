import Foundation

public struct Draw: Effect {
    public var attr: [String: Attribute]

    public init(player: ArgPlayerAttribute = PlayerActor()) {
        self.attr = ["player": player]
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
