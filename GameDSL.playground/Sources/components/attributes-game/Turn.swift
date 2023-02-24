import Foundation

public struct Turn: Attribute {
    public let id: String = "turn"
    let value: String

    public init(_ value: String) {
        self.value = value
    }
}
