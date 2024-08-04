from json_writing import clean_html, load_json_file, write_json_to_file
from parse_nodes import nodes_dict
from parse_patch import patch_dict

# The primary source of item information
items_database_pages_json = load_json_file('items-database-pages.json')

# Supplementary information to aggregate
additional_item_data_json = load_json_file('additional-item-data.json')
item_main_attributes_json = load_json_file('item-main-attributes.json')
item_stats_json = load_json_file('item-stats.json')
leves_json = load_json_file('leves.json')
rarities_json = load_json_file('rarities.json')
recipes_per_item_json = load_json_file('recipes-per-item.json')
ui_categories_json = load_json_file('ui-categories.json')

# Patch IDs by item ID
patch_dict = patch_dict()

# The array of items to be written to JSON file
items = []
nodes_dict = nodes_dict()

for key in items_database_pages_json.keys():
    # The primary source of information for the item
    i = items_database_pages_json[key]

    # The descriptin with HTML elements sanitized
    html_desc = i.get('description')
    desc = {
        'en': clean_html(html_desc.get('en', '')),
        'ja': clean_html(html_desc.get('ja', '')),
        'de': clean_html(html_desc.get('de', '')),
        'fr': clean_html(html_desc.get('fr', '')),
        'ko': clean_html(html_desc.get('ko', '')),
        'zh': clean_html(html_desc.get('zh', '')),
    }

    retrieved_name = i.get('name')
    name = {
        'en': clean_html(retrieved_name.get('en', '')),
        'ja': clean_html(retrieved_name.get('ja', '')),
        'de': clean_html(retrieved_name.get('de', '')),
        'fr': clean_html(retrieved_name.get('fr', '')),
        'ko': clean_html(retrieved_name.get('ko', '')),
        'zh': clean_html(retrieved_name.get('zh', '')),
    }

    # The URL for the image, in higher resolution
    icon = str(i.get('icon', '/i/000000/000033.png')).replace('.png', '_hr1.png')

    # Recipes to craft the item
    recipes = []
    for recipe in recipes_per_item_json.get(key, []):
        try: 
            # Filter out IDs with string values, like some Island Sanctuary items
            id = int(recipe.get('id'))
            # Only assign the fields needed
            new_recipe = {
                'id': id,
                'classJob': recipe.get('job'),
                'lvl': recipe.get('lvl', 1),
                'stars': recipe.get('stars', 0),
                'yields': recipe.get('yields', 1)
            }
            # Add to array
            recipes.append(new_recipe)
        except:
            print(f"bad: {recipe.get('id', 'unknown')}")
            continue

    # Information about repairs, if applicable
    # A value of `0` returns `null` instead
    repair = additional_item_data_json.get(key, {}).get('repair') or None

    # Check if any recipes exist, and determine if it can be crafted
    # canBeCrafted = True if len(i.get('ingredientFor', [])) > 0 else False
    canBeCrafted = True if len(recipes) > 0 else False

    # Determine if an item is eligible for Expert Delivery
    # Must be both equipable and pink/green/blue rarity
    canBeEquipped = bool(i.get('equipable', False))
    rarity = rarities_json.get(key, 1)
    gcReward = i.get('gcReward', None) if rarity in [2, 3, 7] and canBeEquipped else None

    nodes = []
    canBeGathered = False
    try:
        nodes = nodes_dict.get(int(key), [])
    except:
        nodes = []

    if len(nodes) > 0:
        canBeGathered = True

    leves = []
    for l in i.get('usedForLeves', []):
        leve_data = leves_json.get(str(l.get('leve')))
        new_leve = {
            'leve': l.get('leve'),
            'amount': l.get('amount'),
            'lvl': l.get('lvl'),
            'name': {
                'en': clean_html(leve_data.get('en', '')),
                'ja': clean_html(leve_data.get('ja', '')),
                'de': clean_html(leve_data.get('de', '')),
                'fr': clean_html(leve_data.get('fr', ''))
            },
            'classJob': l.get('classJob')
        }
        leves.append(new_leve)

    new_item = {
        # Unique ID of the item
        'id': i.get('id'),

        # Localized name of item
        'name': name,

        # Bonuses for the item, typically food or potions, if applicable
        # - ID: The BaseParam ID of the bonus TODO: Rename `id`
        # - NQ: The bonus amount for NQ item TODO: Rename `nq`
        # - HQ: (Optional) The bonus amount for HQ item TODO: Rename `hq`
        # - Relative: TODO: Exclude? IDK what this is
        # - Max: (Optional) The maximum bonus TODO: Rename `maxNq`
        # - MaxHQ: (Optional) The maximum bonus when using HQ items TODO: Rename `maxHq`
        'bonuses': i.get('bonuses', []),

        # Whether the item can be crafted
        'canBeCrafted': canBeCrafted,

        # Whether the item can be desynthesized TODO
        # 'canBeDesynth': bool(),

        # Whether the item can be dyed TODO
        # 'canBeDyed': bool(),

        # Whether the item can be equipped
        'canBeEquipped': canBeEquipped,

        # Whether the item can be gathered
        'canBeGathered': canBeGathered,

        # Whether the item can be HQ
        'canBeHq': bool(i.get('hq', False)),

        # ClassJobCategory ID for the item, if applicable.
        'classJobCategoryId': i.get('cjc', None),

        # Localized description of item, includes EN, JA, DE, FR, KO, ZH
        'desc': desc,

        # Items that result from desynthesis, mostly for fish TODO
        # 'desynths': [],

        # The class level needed to equip the item
        'equipLevel': i.get('elvl', None),

        # The EquipSlotCategory ID of the item, if equippable
        'equipSlotCategory': i.get('equipSlotCategory', None),

        # The number of Grand Company seals rewarded for an Expert Delivery, if applicable
        # This is for turning in pink/green/blue items, NOT daily Supply/Provisioning missions
        'gcReward': gcReward,

        # The icon URL, nil coalescing to a ? icon
        'icon': icon,

        # Item level
        'ilvl': i.get('ilvl', None),

        # For fish, the URL of the illustration shown, else nil
        'ingameDrawing': i.get('ingameDrawing', None),

        # Whether the item is a fish
        'isFish': bool(i.get('isFish', False)),

        # Whether the item is tradable
        'isTradable': bool(i.get('trade', False)),

        # Whether the item is unique (e.g., dungeon armor)
        'isUnique': bool(i.get('unique', False)),

        # The ID of the item category (e.g., `1` is "Pugilist's Arm" with translations)
        # `63` is "Unknown"
        'itemCategory': ui_categories_json.get(key, 63),

        # Leves the item can be turned in for
        # - leve: The leve's unique ID
        # - amount: The quantity needed
        # - lvl: The requisite class/job level for the leve
        # - classJob: The ID of the requisite class/job for the leve
        'leves': leves,

        # The nodes at which the item can be collected
        'nodes': nodes,

        # ID of patch that the item was added in. `2` is initial release
        'patchId': patch_dict.get(int(key)),

        # Price to purchase the item from an NPC shop
        'price': i.get('price', None),

        # The item's rarity
        'rarity': rarity,

        # Basic information about recipes used to craft the item
        'recipes': recipes,

        # ID of class that can repair the item
        'repair': repair,

        # ID of search category. TODO
        'searchCategory': i.get('searchCategory', 8),

        # The price the item can be sold for, if applicable
        'sellPrice': i.get('sellPrice', None),

        # The number of materia sockets, if applicable
        'sockets': i.get('sockets', 0),

        # Main stats of item (e.g., pDmg and mDmg)
        'statsMain': item_main_attributes_json.get(key, []),

        # TODO: I'm using CodingKeys because these are capitalized. Fix it here.
        # Secondary stats of item (e.g., Vitality, Determination, Critical Hit, Skill Speed)
        # - ID: The BaseParam ID of the stat TODO: Rename `id`
        # - NQ: The NQ value of the stat TODO: Rename `nq`
        # - HQ: (Optional) The HQ value of the stat TODO: rename `hq`
        'statsSecondary': i.get('stats', []),

        # Grand Company daily Supply or Provisioning mission rewards, if applicable.
        # - amount: The quantity needed
        # - xp: The XP rewarded, double for HQ
        # - seals: The Grand Company seals rewarded, double for HQ
        'supply': i.get('supply', None)
    }
    # Include only if a name and ID is provided, and if not a belt (obsolete)
    if new_item.get('name', {}).get('en', '') != '' and \
        new_item.get('id') > 0 and \
        new_item.get('itemCategory') != 39:
            items.append(new_item)


print(f"Total items: {len(items)}")
write_json_to_file(data=items, file_path=f"./XIVHelperDataBuilder/JSON/item.json")
