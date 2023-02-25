import Foundation

/// Exact number
public struct NumExact: ArgNumberAttribute {
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}
