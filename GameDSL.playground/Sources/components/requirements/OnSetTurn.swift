import Foundation

public struct OnSetTurn: Requirement {

    public init() { }

    public func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}
