import Foundation

@resultBuilder
public struct EffectBuilder {

    public static func buildBlock(_ components: Effect...) -> [Effect] {
        components
    }
}
