import Foundation

/// When just eliminated
public struct OnEliminated: Requirement {

    public init() {}

    public func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}
