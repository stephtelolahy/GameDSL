import Foundation

/// Equip with a card, ie put in self's play location
public struct Equip: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]

    public init() { }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
