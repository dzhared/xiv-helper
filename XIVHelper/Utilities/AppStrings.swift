import Foundation
import SwiftUI

/// Strings used throughout the app.
enum AppStrings {
    /// Strings used throughout the app.
    enum General {
        static let about = String(localized: "general.about")
        static let appName = String(localized: "general.appName")
        static let confirm = String(localized: "general.confirm")
        static let description = String(localized: "general.description")
        static let done = String(localized: "general.done")
        static let equipment = String(localized: "general.equipment")
        static let expansion = String(localized: "general.expansion")
        static let expertDelivery = String(localized: "general.expertDelivery")
        static let gathering = String(localized: "general.gathering")
        static let ingredients = String(localized: "general.ingredients")
        static let items = String(localized: "general.items")
        static let leves = String(localized: "general.leves")
        static let masterRecipe = String(localized: "general.masterRecipe")
        static let quantity = String(localized: "general.quantity")
        static let recipes = String(localized: "general.recipes")
        static let result = String(localized: "general.result")
        static let settings = String(localized: "general.settings")
        static let sort = String(localized: "general.sort")
        static let textAndBoldText = String(localized: "general.textAndBoldText")
        static let yes = String(localized: "general.yes")
    }

    /// Strings used in the info view tab.
    enum Info {
        static let about = String(localized: "info.about")
        static let credits = String(localized: "info.credits")
        static let creditsLodestoneNews = String(localized: "info.creditsLodestoneNews")
        static let creditsLodestoneNewsURL = String(localized: "info.creditsLodestoneNewsURL")
        static let creditsTeamcraft = String(localized: "info.creditsTeamcraft")
        static let creditsTeamcraftURL = String(localized: "info.creditsTeamcraftURL")
        static let databaseVersion = String(localized: "info.databaseVersion")
        static let emailMe = String(localized: "info.emailMe")
        static let emailMeURL = String(localized: "info.emailMeURL")
        static let legal = String(localized: "info.legal")
        static let privacyPolicy = String(localized: "info.privacyPolicy")
        static let privacyPolicyURL = String(localized: "info.privacyPolicyURL")
    }

    /// Strings used on views pertaining to Items.
    enum Item {
        static let allNodes = String(localized: "item.allNodes")
        static let bonuses = String(localized: "item.bonuses")
        static let canBeHQ = String(localized: "item.canBeHQ")
        static let canBeQuickSynthesized = String(localized: "item.canBeQuickSynthesized")
        static let cannotBeHQ = String(localized: "item.cannotBeHQ")
        static let cannotBeQuickSynthesized = String(localized: "item.cannotBeQuickSynthesized")
        static let deleteRecipe = String(localized: "item.deleteRecipe")
        static let grandCompanyQuantity = String(localized: "item.grandCompanyQuantity")
        static let levelAndType = String(localized: "item.levelAndType")
        static let locationAndCoordinates = String(localized: "item.locationAndCoordinates")
        static let noRecipes = String(localized: "item.noRecipes")
        static let seals = String(localized: "item.seals")
        static let stats = String(localized: "item.stats")
        static let xp = String(localized: "item.xp")
    }

    /// Strings used in the Lodestone News section of the app.
    enum LodestoneNews {
        static let keepReading = String(localized: "lodestoneNews.keepReading")
        static let openInWebBrowser = String(localized: "lodestoneNews.openInWebBrowser")
        static let share = String(localized: "lodestoneNews.share")
        static let tapToLoad = String(localized: "lodestoneNews.tapToLoad")
        static let tapToRetry = String(localized: "lodestoneNews.tapToRetry")
    }

    /// Strings used for navigation.
    enum Navigation {
        static let about = String(localized: "navigation.about")
        static let allNodes = String(localized: "navigation.allNodes")
        static let credits = String(localized: "navigation.credits")
        static let itemDetail = String(localized: "navigation.itemDetail")
        static let legal = String(localized: "navigation.legal")
        static let lodestoneNews = String(localized: "navigation.lodestoneNews")
        static let recipeDetail = String(localized: "navigation.recipeDetail")
        static let savedRecipes = String(localized: "navigation.savedRecipes")
        static let search = String(localized: "navigation.search")
        static let shoppingList = String(localized: "navigation.shoppingList")
    }

    /// Strings used on views pertaining to searches.
    enum Search {
        static let ascending = String(localized: "search.ascending")
        static let descending = String(localized: "search.descending")
        static let noResults = String(localized: "search.noResults")
        static let pickerPrompt = String(localized: "search.pickerPrompt")
        static let searchButton = String(localized: "search.searchButton")
        static let searchFieldPrompt = String(localized: "search.searchFieldPrompt")
    }

    /// Strings used in the Shopping List view.
    enum ShoppingList {
        static let baseMaterials = String(localized: "shoppingList.baseMaterials")
    }

    /// Strings used when listing available sort methods.
    enum SortMethod {
        static let alphabetical = String(localized: "sortMethod.alphabetical")
        static let ilvl = String(localized: "sortMethod.ilvl")
        static let patch = String(localized: "sortMethod.patch")
        static let rlvl = String(localized: "sortMethod.rlvl")
    }

    /// Strings used in the tab bar.
    enum TabView {
        static let info = String(localized: "tabView.info")
        static let news = String(localized: "tabView.news")
        static let recipes = String(localized: "tabView.recipes")
        static let search = String(localized: "tabView.search")
    }

    /// Strings used in the User ("Recipes") view.
    enum User {
        static let createShoppingList = String(localized: "user.createShoppingList")
        static let deleteAll = String(localized: "user.deleteAll")
        static let deleteItem = String(localized: "user.deleteItem")
        static let deletionConfirmation = String(localized: "user.deletionConfirmation")
        static let noRecipes = String(localized: "user.noRecipes")
        static let sortMethod = String(localized: "user.sortMethod")
        static let sortOrder = String(localized: "user.sortOrder")
    }
}
