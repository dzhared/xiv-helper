from json_writing import load_json_file

patch_content_json = load_json_file('patch-content.json')

def patch_dict():
    dict = {}
    for key in patch_content_json:
        all_items = patch_content_json.get(key, {}).get('item', [])
        for item in all_items:
            dict[item] = int(key)
    return dict

# dict = patch_dict()
# print(dict[41112])