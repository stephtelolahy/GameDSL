import Foundation

public struct Hand: CardLocation {
    public let id: String = "hand"
    public let cards: [Card]

    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
    }
}
