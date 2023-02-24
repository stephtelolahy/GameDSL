import Foundation

public struct Deck: CardLocation {
    public let id: String = "deck"
    public let cards: [Card]
    
    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
    }
}
