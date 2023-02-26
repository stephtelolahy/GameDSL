import Foundation

/// Cancel some queued events
public struct Cancel: Effect {
    public var ctx: [String: Attribute] = [:]

    public init() {}

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
