import Foundation

public protocol ArgPlayerAttribute: Attribute {
//    func resolve(_ ctx: Game) -> Result<Any, Error>
}

public extension ArgPlayerAttribute {
    var id: String {
        "player"
    }
}
