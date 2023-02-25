import Foundation

/// Game is over
public struct IsGameOver: Requirement {

    public init() {}

    public func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}
