import Foundation


@resultBuilder
public struct CardActionsBuilder {

    public static func buildBlock(_ components: CardAction...) -> [CardAction] {
        components
    }
}

@resultBuilder
public struct CardActionBuilder {

    public static func buildBlock(_ component: CardAction) -> CardAction {
        component
    }

    static func buildArray(_ components: [CardAction]) -> CardAction {
        fatalError()
    }
}
