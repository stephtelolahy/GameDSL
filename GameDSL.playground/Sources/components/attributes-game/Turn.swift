import Foundation

public struct Turn: Attribute {
    public let name: String = "turn"
    let value: String

    public init(_ value: String) {
        self.value = value
    }
}
