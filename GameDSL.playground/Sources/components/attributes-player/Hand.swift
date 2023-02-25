import Foundation

public struct Hand: CardLocationAttribute {
    public let id: String = "hand"
    public let cards: [Card]
    public var visibility: [String]?

    public init(@CardBuilder _ cards: () -> [Card]) {
        self.cards = cards()
        self.visibility = ["owner"]
    }
}
