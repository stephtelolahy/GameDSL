import Foundation

/// Emit active moves
public struct Activate: Event {
    let options: [Event]

    public init(_ options: [Event]) {
        self.options = options
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

