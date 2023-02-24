import Foundation

public struct SideEffects: Attribute {
    public let elementName: String = "onPlay"
    let effects: [Effect]

    public init(@EffectBuilder _ content: () -> [Effect]) {
        self.effects = content()
    }
}
