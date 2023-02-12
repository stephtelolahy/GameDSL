import Foundation

public struct Player: Identifiable {
    public let id: String
    let attr: [Attribute]
}

public extension Player {
    init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.init(id: id, attr: content())
    }
}
