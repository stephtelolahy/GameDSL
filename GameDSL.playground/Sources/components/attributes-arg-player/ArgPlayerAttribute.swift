import Foundation

public protocol ArgPlayerAttribute: Attribute {
//    func resolve(_ ctx: Game) -> Result<Any, Error>
}

extension ArgPlayerAttribute {
    public var id: String { fatalError() }
}
