/// Strings used throughout the app.
enum AppStrings {

    /// Strings used throughout the app.
    enum General {
        static let appName = "XIV Helper"
        static let settings = "Settings"
    }

    /// Strings used in the info view tab.
    enum Info {
        static let about = """
        This app helps find and organize item and recipe information for Final Fantasy XIV. To \
        find an item or recipe, tap the search icon on the bottom bar and search by item name. \
        Relevant item and recipe information, including stats, bonuses, relevant leves and Grand \
        Company turnins, and more is displayed on an item's detail page.

        To save a craftable item's recipe, tap a Recipe on its \(AppStrings.Navigation.itemDetail) \
        screen, if any are available. This displays crafting information, including an ingredient \
        list and relevant stats. To save a recipe, tap the + icon to add it, and choose a desired \
        quantity to craft. This will add it to the Saved Recipes tab. Items that yield more than \
        one are selected in multiples of their respective yield.

        To generate a shopping list for all the recipes you've saved, tap the \
        \(AppStrings.User.createShoppingList) button on the \(AppStrings.Navigation.savedRecipes) \
        tab. This aggregates the ingredients from all the recipes with their respective quantities \
        to make shopping for ingredients much easier.
        """
        static let creditsLodestoneNews = "Lodestone News API"
        static let creditsLodestoneNewsURL = "https://lodestonenews.com/"
        static let creditsTeamcraft = "Game data from FFXIV Teamcraft used under MIT License"
        static let creditsTeamcraftURL = "https://github.com/ffxiv-teamcraft/ffxiv-teamcraft"
        static let emailMe = "Bugs? Feedback? Contact me!"
        static let emailMeURL = "mailto:xivhelper@pm.me"
        static let legal = """
        XIV Helper is not an official product of Final Fantasy XIV or Square Enix, Inc. All game \
        and news content shown in the app is owned by Square Enix, and the use of such content is \
        permitted only for non-commercial purposes, in accordance with the Materials Usage \
        License, as specified on the Final Fantasy XIV website.\n\n© SQUARE ENIX CO., LTD. All \
        Rights Reserved.
        """
        static let privacyPolicy = "Privacy Policy"
        static let privacyPolicyURL = "https://sites.google.com/view/xivhelper-privacypolicy"
    }

    /// Strings used on views pertaining to Items.
    enum Item {
        static let noRecipes = "This item has no recipes."
    }

    /// Strings used for navigation.
    enum Navigation {
        static let allNodes = "All Nodes"
        static let info = "About"
        static let itemDetail = "Item Detail"
        static let lodestoneNews = "Lodestone News"
        static let recipeDetail = "Recipe Detail"
        static let savedRecipes = "Saved Recipes"
        static let search = "Search"
        static let shoppingList = "Shopping List"
    }

    /// Strings used on views pertaining to searches.
    enum Search {
        static let noResults = "No results. Please try again."
        static let searchButton = "Tap to search."
        static let searchFieldPrompt = "Search for "
        static let pickerPrompt = "Search For"
    }

    /// Strings used in the Shopping List view.
    enum ShoppingList {
        static let baseMaterials = "Base Materials Only"
    }

    /// Strings used in the tab bar.
    enum TabView {
        static let recipes = "Recipes"
        static let search = "Search"
        static let news = "News"
        static let info = "Info"
    }

    /// Strings used in the User ("Recipes") view.
    enum User {
        static let deletionConfirmation = "Delete all saved recipes?"
        static let deleteItem = "Delete item"
        static let deleteAll = "Delete All"
        static let createShoppingList = "Create Shopping List"
        static let noRecipes = "No recipes added yet. Tap here to go to the search screen."
        static let sortMethod = "Sort By"
        static let sortOrder = "Sort Order"
    }
}
