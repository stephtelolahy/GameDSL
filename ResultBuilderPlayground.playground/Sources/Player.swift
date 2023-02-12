import Foundation

public struct Player {
    let id: String
    let attr: [Attribute]
}

public extension Player {
    init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.init(id: id, attr: content())
    }
}
