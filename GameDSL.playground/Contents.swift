import Foundation

let beer = CardImpl("beer", actions:  {
    CardActionImpl(playable: true) {
        Heal(1)
    } requirements: {
        PlayerAtLeast(3)
    }
})

let stagecoach = CardImpl("stagecoach", actions: {
    CardActionImpl(playable: true) {
        Draw()
        Draw()
    }
})

let dynamite = CardImpl("dynamite", actions: {
    CardActionImpl(playable: false) {
        Luck("♥️") {
            Heal(1)
        } onFailure: {
            Damage(3)
        }
    }
})

let elGringo = PlayerImpl("elGringo") {
    Health(2)
    Hand {
        "gatling"
        "missed"
    }
}

let ctx = GameImpl {
    "suzzyLafayette"
    "vultureSam"
    elGringo
} attr: {
    Turn("elGringo")
    Deck {
        beer
        stagecoach
        dynamite
    }
}

print(ctx)

