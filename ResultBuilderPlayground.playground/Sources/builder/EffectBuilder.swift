import Foundation

@resultBuilder
public struct EffectBuilder {

    public static func buildBlock(_ components: Effect...) -> [Effect] {
        components
    }

    static func buildArray(_ components: [[Effect]]) -> [Effect] {
        components.flatMap { $0 }
    }
}
