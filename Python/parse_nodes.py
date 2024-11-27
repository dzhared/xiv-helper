from json_writing import clean_html, load_json_file, write_json_to_file

nodes_json = load_json_file('nodes.json')
nodes_database_pages_json = load_json_file('nodes-database-pages.json')
map_entries_json = load_json_file('map-entries.json')
places_json = load_json_file('places.json')

map_name_dict = {entry['id']: entry['name'] for entry in map_entries_json}

dict_by_en = {}
for key in places_json:
    # Get the localized names of a place.
    places = places_json.get(key)
    # Retrieve just the English name. This will be used as a key.
    en = str(places.get('en'))
    # If the entry is blank, skip it.
    if len(en) == 0:
        continue
    # Convert to a dictionary where the English name is the key, and it contains the localized name.
    dict_by_en[en] = {
        'en': places.get('en'),
        'fr': places.get('fr'),
        'de': places.get('de'),
        'ja': places.get('ja'),
    }

def parse_nodes():
    nodes = []
    
    for key in nodes_json:
        try:
            n = nodes_database_pages_json[key]
            map = int(n.get('map'))
            map_name_en = map_name_dict.get(map)
            map_names = dict_by_en.get(map_name_en)
            map_name = {
                'en': map_names.get('en'),
                'de': map_names.get('de'),
                'fr': map_names.get('fr'),
                'ja': map_names.get('ja'),
            }

            new_node = {
                'id': int(n.get('id')),
                'items': nodes_json.get(key).get('items', []),
                'limited': bool(n.get('limited')),
                'level': int(n.get('level')),
                'type': int(n.get('type', 0)),
                'legendary': bool(n.get('legendary')),
                'ephemeral': bool(n.get('ephemeral')),
                'spawns': n.get('spawns', []),
                'duration': int(n.get('duration', 0)),
                'zoneId': int(n.get('zoneid')),
                'radius': int(n.get('radius')),
                'x': float(n.get('x')),
                'y': float(n.get('y')),
                'z': float(n.get('z', 0)),
                'map': map,
                'mapName': map_name,
                'hiddenItems': nodes_json.get(key).get('hiddenItems', []),
                'name': {
                    'en': clean_html(n.get('en')),
                    'ja': clean_html(n.get('ja')),
                    'de': clean_html(n.get('de')),
                    'fr': clean_html(n.get('fr')),
                },
                'patch': int(n.get('patch', 2))
            }
            nodes.append(new_node)
        except:
            continue
    
    return nodes

def nodes_dict():
    nodes = parse_nodes()
    nodes_dict = {}
    
    for node in nodes:
        items = node['items']
        for item_id in items:
            if item_id not in nodes_dict:
                nodes_dict[item_id] = []

            # Check if a node with the same id already exists in nodes_dict[item_id]
            existing_node_ids = [n['id'] for n in nodes_dict[item_id]]
            if node['id'] not in existing_node_ids:
                nodes_dict[item_id].append(node)
    
    return nodes_dict

if __name__ == '__main__':
    dict = nodes_dict()
    write_json_to_file(dict, 'test.json')