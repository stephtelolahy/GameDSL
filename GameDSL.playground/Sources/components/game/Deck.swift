import Foundation

public struct Deck: Attribute {
    public let id: String = "deck"
    let cards: [Card]
    
    public init(@CardBuilder _ content: () -> [Card]) {
        self.cards = content()
    }
}
