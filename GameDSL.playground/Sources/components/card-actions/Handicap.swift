import Foundation

/// Handicap another player with a card, ie put in other's play location
public struct Handicap: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var target: ArgPlayer?
    public var ctx: [String: Attribute] = [:]

    public init() { }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
