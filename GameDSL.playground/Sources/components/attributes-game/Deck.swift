import Foundation

public struct Deck: CardLocationAttribute {
    public let name: String = "deck"
    public let cards: [Card]
    public var visibility: [String]?

    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
        self.visibility = []
    }
}
