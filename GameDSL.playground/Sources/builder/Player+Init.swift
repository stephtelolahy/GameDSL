import Foundation

public extension Player {
    init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.init(id: id, attr: content())
    }
}
