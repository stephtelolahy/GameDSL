import Foundation

/// Exact number
public struct NumExact: ArgNumber {
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}
