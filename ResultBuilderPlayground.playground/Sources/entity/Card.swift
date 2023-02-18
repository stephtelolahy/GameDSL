import Foundation

public struct Card: Identifiable {
    public let id: String
    let attr: [Attribute]
}

public extension Card {
    init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.init(id: id, attr: content())
    }
}
