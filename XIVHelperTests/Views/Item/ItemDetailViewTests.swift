import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class ItemDetailViewTests: XCTestCase {

    var subject: ItemDetailView!

    override func setUp() {
        subject = ItemDetailView(
            item: Item(
                id: 40932,
                name: LocalizedString(en: "Mandervillous Falchion", ja: "マンダヴィラス・ファルシオン", de: "Mandervillöses Manderville-Falchion", fr: "Fauchon manderveilleux des Manderville"),
                bonuses: [],
                canBeCrafted: false,
                canBeEquipped: true,
                canBeGathered: false,
                canBeHq: false,
                classJobCategoryId: 20,
                desc: LocalizedString(en: "Mandervillous Manderville weapon.", ja: "[マンダヴィルウェポン・マンダヴィラス]", de: "[Mandervillöse Manderville-Waffe]", fr: "[Arme manderveilleuse des Manderville]"),
                equipLevel: 90,
                equipSlotCategory: 1,
                gcReward: nil,
                icon: "/i/030000/030670_hr1.png",
                ilvl: 665,
                ingameDrawing: "/i/079000/079771.png",
                isFish: false,
                isTradable: false,
                isUnique: true,
                itemCategory: 2,
                leves: [],
                nodes: [],
                patchId: 93,
                price: 2,
                rarity: 4,
                recipes: [],
                repair: 9,
                searchCategory: 8,
                sellPrice: nil,
                sockets: 0,
                statsMain: [
                    Stat(id: 12, nq: 132, hq: 132)
                ],
                statsSecondary: [
                    Stat(id: 1, nq: 297, hq: nil),
                    Stat(id: 3, nq: 327, hq: nil),
                ],
                supply: nil
            )
        )
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshots(of: subject, as: [.image])
    }
}
