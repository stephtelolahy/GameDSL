import Foundation

/// The minimum number of active players is X
public struct IsPlayersAtLeast: Requirement {
    let count: Int

    public init(_ count: Int) {
        self.count = count
    }

    public func match(_ ctx: Game) -> Result<Void, Error> {
        fatalError()
    }
}
