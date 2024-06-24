import XCTest

@testable import XIV_Helper

final class ItemTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var item: Item!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        item = Item(
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
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        item = nil
    }

    /// The computed properties initialize correctly.
    func testItemComputedProperties() {
        /// The `ClassJobCategory` initializes correctly.
        XCTAssertEqual(item.classJobCategory?.name, ClassJobCategory(id: 20).name)

        /// The icon `URL` initializes correctly.
        var expected: URL = URL(string: "https://xivapi.com/i/030000/030670_hr1.png")!
        XCTAssertEqual(item.iconUrl.absoluteString, expected.absoluteString)

        /// The `ingameDrawingUrl` initializes correctly if one exists.
        expected = URL(string: "https://xivapi.com/i/079000/079771.png")!
        XCTAssertEqual(item.ingameDrawingUrl, expected)

        /// `isUntradable` is the opposite of the `isTradable` property at initialization.
        XCTAssertEqual(item.isUntradable, true)

        /// The `Patch` initializes correctly.
        XCTAssertEqual(item.patch, Patch(id: item.patchId))
    }

    /// The `Item` encodes and decodes as expected.
    func testItemEncodeDecode() throws {
        let encoded = try encoder.encode(item)
        let decoded = try decoder.decode(Item.self, from: encoded)
        XCTAssertEqual(decoded.bonuses, item.bonuses)
        XCTAssertEqual(decoded.canBeCrafted, item.canBeCrafted)
        XCTAssertEqual(decoded.canBeEquipped, item.canBeEquipped)
        XCTAssertEqual(decoded.canBeHq, item.canBeHq)
        XCTAssertEqual(decoded.classJobCategory, item.classJobCategory)
        XCTAssertEqual(decoded.desc, item.desc)
        XCTAssertEqual(decoded.equipLevel, item.equipLevel)
        XCTAssertEqual(decoded.equipSlotCategory, item.equipSlotCategory)
        XCTAssertEqual(decoded.gcReward, item.gcReward)
        XCTAssertEqual(decoded.iconUrl, item.iconUrl)
        XCTAssertEqual(decoded.id, item.id)
        XCTAssertEqual(decoded.ilvl, item.ilvl)
        XCTAssertEqual(decoded.ingameDrawingUrl, item.ingameDrawingUrl)
        XCTAssertEqual(decoded.isFish, item.isFish)
        XCTAssertEqual(decoded.isUnique, item.isUnique)
        XCTAssertEqual(decoded.isUntradable, item.isUntradable)
        XCTAssertEqual(decoded.itemCategory, item.itemCategory)
        XCTAssertEqual(decoded.leves, item.leves)
        XCTAssertEqual(decoded.name, item.name)
        XCTAssertEqual(decoded.patch, item.patch)
        XCTAssertEqual(decoded.patchId, item.patchId)
        XCTAssertEqual(decoded.price, item.price)
        XCTAssertEqual(decoded.rarity, item.rarity)
        XCTAssertEqual(decoded.recipes, item.recipes)
        XCTAssertEqual(decoded.repair, item.repair)
        XCTAssertEqual(decoded.searchCategory, item.searchCategory)
        XCTAssertEqual(decoded.sellPrice, item.sellPrice)
        XCTAssertEqual(decoded.sockets, item.sockets)
        XCTAssertEqual(decoded.statsMain, item.statsMain)
        XCTAssertEqual(decoded.statsSecondary, item.statsSecondary)
        XCTAssertEqual(decoded.supply, item.supply)
    }
}
