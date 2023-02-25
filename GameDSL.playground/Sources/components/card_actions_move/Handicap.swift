import Foundation

/// Handicap another player with a card, ie put in other's play location
public struct Handicap: Effect {
    public var ctx: [String: Attribute] = [:]
    let target: ArgPlayer

    public init(target: ArgPlayer) {
        self.target = target
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
