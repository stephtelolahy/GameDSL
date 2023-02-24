import Foundation

public struct PlayerAtLeast: Requirement {
    let minCount: Int

    public init(_ count: Int) {
        self.minCount = count
    }
}
