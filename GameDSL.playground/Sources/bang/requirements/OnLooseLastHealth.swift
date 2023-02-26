import Foundation

/// When loosing last life point
public struct OnLooseLastHealth: Requirement {

    public init() {}

    public func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}
