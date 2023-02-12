import Foundation

public struct Game {
    let attr: [Attribute]
}

public extension Game {
    init(@AttributeBuilder _ content: () -> [Attribute]) {
        self.init(attr: content())
    }
}
