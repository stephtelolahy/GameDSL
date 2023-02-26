import Foundation

public struct Health: Attribute {
    public let name: String = "health"
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}
