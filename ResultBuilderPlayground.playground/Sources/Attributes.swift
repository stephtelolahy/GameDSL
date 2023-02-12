import Foundation

public struct Value: Attribute {
    public let elementName: String = "value"
    let value: String

    public init(_ value: String) {
        self.value = value
    }
}

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

public struct Active: Attribute {
    public let elementName: String = "active"
    let player: Player

    public init(_ player: Player) {
        self.player = player
    }
}

public struct Turn: Attribute {
    public let elementName: String = "turn"
    let value: String

    public init(_ value: String) {
        self.value = value
    }
}
