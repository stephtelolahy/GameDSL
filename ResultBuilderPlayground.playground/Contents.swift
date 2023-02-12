import Foundation

var ctx = Game {
    Player("suzzyLafayette")
    Player("elGringo") {
        Health(2)
        Hand {
            Card("gatling")
            Card("beer") {
                Value("6♥️")
            }
        }
    }
    Player("vultureSam")
}.turn("willyTheKid")

print("hello \(ctx)")

