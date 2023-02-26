import Foundation

/// Equip with a card, ie put in self's play location
public struct Equip: Effect {
    public var ctx: [String: Attribute] = [:]

    public init() { }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
