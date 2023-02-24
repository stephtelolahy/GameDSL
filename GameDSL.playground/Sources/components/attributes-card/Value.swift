import Foundation

public struct Value: Attribute {
    public let id: String = "value"
    let value: String

    public init(_ value: String) {
        self.value = value
    }
}
