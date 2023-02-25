import Foundation

public struct Draw: Effect {
    public let attr: [String: Attribute]

    public init(@AttributeBuilder attr: () -> [Attribute]) {
        self.attr = attr().toDictionary()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
