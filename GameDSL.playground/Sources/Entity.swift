import Foundation

public protocol Attribute {
    var elementName: String { get }
}

public struct Card: Identifiable {
    public let id: String
    public let attr: [Attribute]
}

public protocol Effect {}

public struct Player: Identifiable {
    public let id: String
    public let attr: [Attribute]
}

public struct Game {
    var attr: [Attribute] = []
}
