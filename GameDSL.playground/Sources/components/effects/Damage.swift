import Foundation

public struct Damage: Effect {
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
