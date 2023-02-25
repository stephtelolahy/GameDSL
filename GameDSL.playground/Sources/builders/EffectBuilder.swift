import Foundation

@resultBuilder
public struct EffectBuilder {

    public static func buildBlock(_ component: Effect) -> Effect {
        component
    }

    static func buildArray(_ components: [Effect]) -> Effect {
        fatalError()
    }
}
