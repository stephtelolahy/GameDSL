import Foundation

public extension Card {
    init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.init(id: id, attr: content())
    }
}
