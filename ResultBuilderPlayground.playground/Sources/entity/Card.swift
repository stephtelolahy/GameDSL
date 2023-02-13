import Foundation

public struct Card: Identifiable {
    public let id: String
    let effects: [Effect]
    let attr: [Attribute]
}

public extension Card {
    init(_ id: String, @EffectBuilder _ content: () -> [Effect] = { [] }) {
        self.id = id
        self.effects = content()
        self.attr = []
    }
}
