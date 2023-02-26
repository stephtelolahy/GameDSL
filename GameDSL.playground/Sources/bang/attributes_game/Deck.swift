import Foundation

public struct Deck: Attribute {
    public let name: String = "deck"
    public let cards: [Card]

    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
    }
}
