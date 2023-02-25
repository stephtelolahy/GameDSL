import Foundation

let beer = CardImpl("beer") {
    Heal(1)
        .active {
            PlayerAtLeast(3)
        }
} attr: {
    Value("6♥️")
}

let stagecoach = CardImpl("stagecoach", actions: {
    Group {
        Draw()
        Draw()
    }
    .active()
})

// TODO: equipement

// TODO: handicap

let dynamite = CardImpl("dynamite", actions: {
    Luck("♥️") {
        Heal(1)
    } onFailure: {
        Damage(3)
    }
    .triggered()
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

