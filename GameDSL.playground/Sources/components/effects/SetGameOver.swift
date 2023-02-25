import Foundation

/// Set game over
public struct SetGameOver: Effect {
    public var ctx: [String: Attribute] = [:]

    public init() {}

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
