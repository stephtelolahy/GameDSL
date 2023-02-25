import Foundation

public struct Abilities: Attribute {
    public let name: String = "abilities"
    public let content: [Card]

    public init(@CardBuilder _ content: () -> [Card]) {
        self.content = content()
    }
}
