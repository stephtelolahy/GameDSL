import Foundation

public struct Heal: Effect {
    let value: Int

    public init(_ value: Int) {
        self.value = value
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
