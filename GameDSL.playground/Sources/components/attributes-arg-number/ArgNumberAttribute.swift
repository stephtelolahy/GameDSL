import Foundation

public protocol ArgNumberAttribute: Attribute {
//    func resolve(_ ctx: Game) -> Result<Any, Error>
}

extension ArgNumberAttribute {
    public var id: String { fatalError() }
}
