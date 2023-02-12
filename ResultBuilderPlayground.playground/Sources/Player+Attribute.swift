import Foundation

public struct Health: Attribute {
    public let elementName: String = "health"
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}

public struct Hand: Attribute {
    public let elementName: String = "hand"
    let cards: [Card]

    public init(@CardBuilder _ content: () -> [Card]) {
        self.cards = content()
    }
}
