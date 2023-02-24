import Foundation

public struct Game {
    var attr: [Attribute] = []
}

public extension Game {
    init(@AttributeBuilder _ content: () -> [Attribute]) {
        self.attr = content()
    }
}
