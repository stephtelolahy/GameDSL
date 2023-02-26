import Foundation

public struct Hand: Attribute {
    public let name: String = "hand"
    public let cards: [Card]

    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
    }
}
