import Foundation

public extension Game {
    init(@AttributeBuilder _ content: () -> [Attribute]) {
        self.attr = content()
    }
}
