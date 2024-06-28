from json_writing import load_json_file, write_json_to_file

# The primary source of recipe information
recipes_json = load_json_file('recipes.json')

# Additional information for results and masterbooks
items_json = load_json_file('items.json')
items_database_pages_json = load_json_file('items-database-pages.json')
item_icons_json = load_json_file('item-icons.json')
item_patch_json = load_json_file('item-patch.json')
ui_categories_json = load_json_file('ui-categories.json')

# Start with empty array of recipes
recipes = []

# Iterate through all recipes
for r in recipes_json:
    # Skip if ID cannot be cast as integer (usu. island sanctuary recipes)
    try:
        id = int(r.get('id'))
    except:
        continue

    # Skip if result is non-existent
    if r.get('result') == 0:
        continue

    # Construct ingredients array
    ingredients = []
    for i in r.get('ingredients', []):
        id = i.get('id')
        new_ingredient = {
            'id': id,
            'ingredientItemIcon': item_icons_json.get(str(id)),
            'name': items_json.get(str(id)),
            'quantity': i.get('amount')
        }
        ingredients.append(new_ingredient)

    # Construct master recipe book localized name, if applicable
    masterbookId = r.get('masterbook', None)
    masterbookItemIcon = item_icons_json.get(str(masterbookId), None)
    masterbookName = items_json.get(str(masterbookId), None)

    # Construct result item ID, name and icon URL
    resultId = int(r.get('result'))
    resultItemCategory = ui_categories_json.get(str(resultId), 63)
    resultItemIcon = item_icons_json.get(str(resultId), '/i/000000/000033.png')
    resultName = items_json.get(str(resultId), None)
    resultIlvl = items_database_pages_json.get(str(resultId), None).get('ilvl', 0)
    resultPatch = item_patch_json.get(str(resultId), 2)

    # Construct the recipe as JSON
    new_recipe = {
        # Unique ID of the recipe
        'id': int(r.get('id')),

        # Whether the item can be High Quality
        'canHq': bool(r.get('hq', False)),

        # Whether the item can be quick synthesized
        'canQs': bool(r.get('qs', False)),
    
        # The ID of the DoH class to craft the recipe
        'classJobId': int(r.get('job')),

        # The level needed to unlock the recipe
        'classJobLevel': int(r.get('lvl')),

        # The Durability for crafting the recipe (i.e., 80)
        'durability': int(r.get('durability')),
    
        # Whether the recipe is an expert recipe
        'expert': bool(r.get('expert', False)),

        # The items and quantities needed to craft the recipe
        'ingredients': ingredients,

        # The item ID of the masterbook needed
        'masterbookId': masterbookId,

        # The icon url of the masterbook needed
        'masterbookItemIcon': masterbookItemIcon,

        # The localized name of the masterbook needed
        'masterbookName': masterbookName,

        # The Progress of the recipe
        'progress': int(r.get('progress')),

        # The Quality of the recipe
        'quality': int(r.get('quality')),

        # The rlvl of the recipe
        'recipeLevel': int(r.get('rlvl', 1)),

        # The Control stat required for the recipe
        'requiredControl': int(r.get('controlReq')),

        # The Craftsmanship stat required for the recipe
        'requiredCraftsmanship': int(r.get('craftsmanshipReq')),

        # The Quality required to succeed in crafting the recipe; very rare
        'requiredQuality': int(r.get('requiredQuality', 0)),

        # The ID of the resulting item
        'resultId': int(resultId),

        # The ilvl of the resulting item
        'resultIlvl': resultIlvl,

        # The ItemCategory ID of the resulting item
        'resultItemCategory': int(resultItemCategory),

        # The icon URL of the resulting item
        'resultItemIcon': str(resultItemIcon),

        # The localized name of the resulting item
        'resultName': resultName,

        # The patch at which the resulting item was released
        'resultPatch': resultPatch,

        # The number of stars for the recipe, if any
        'stars': int(r.get('stars', 0)),

        # The Control stat suggested for the recipe
        # NOTE: Always 0 as of Dawntrail update
        'suggestedControl': int(r.get('suggestedControl', 0)),

        # The Craftsmanship stat suggested for the recipe
        'suggestedCraftsmanship': int(r.get('suggestedCraftsmanship')),

        # The number of resulting items needed
        'yields': int(r.get('yields', 1))
    }

    # Filter out obsolete Belt items and add
    if resultItemCategory != 39:
        recipes.append(new_recipe)

print(f"Total recipes in end: {len(recipes)}")
write_json_to_file(data=recipes, file_path=f"./XIVHelperDataBuilder/JSON/recipe.json")