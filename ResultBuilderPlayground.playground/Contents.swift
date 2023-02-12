import Foundation

var player = Player("elGringo") {
    Health(2)
    Hand {
        Card("gatling")
        Card("beer") {
            Value("6♥️")
        }
    }
}

var ctx = Game {
    Turn("p1")
}

print("hello \(ctx)")

