import Foundation

public struct Hand: Attribute {
    public let elementName: String = "hand"
    let cards: [Card]

    public init(@CardBuilder _ content: () -> [Card]) {
        self.cards = content()
    }
}
