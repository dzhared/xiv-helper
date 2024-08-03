from json_writing import clean_html, load_json_file

nodes_json = load_json_file('nodes.json')
nodes_database_pages_json = load_json_file('nodes-database-pages.json')
map_entries_json = load_json_file('map-entries.json')

map_name_dict = {entry['id']: entry['name'] for entry in map_entries_json}

def parse_nodes():
    nodes = []
    
    for key in nodes_json:
        try:
            n = nodes_database_pages_json[key]
            map = int(n.get('map'))

            new_node = {
                'id': int(n.get('id')),
                'items': nodes_json.get(key, {}).get('items', []),
                'limited': bool(n.get('limited', False)),
                'level': int(n.get('level')),
                'type': int(n.get('type', 0)),
                'legendary': bool(n.get('legendary', False)),
                'ephemeral': bool(n.get('ephemeral', False)),
                'spawns': n.get('spawns', []),
                'duration': int(n.get('duration', 0)),
                'zoneId': int(n.get('zoneid')),
                'radius': int(n.get('radius')),
                'x': float(n.get('x')),
                'y': float(n.get('y')),
                'z': float(n.get('z', 0)),
                'map': map,
                'mapName': {
                    'en': map_name_dict.get(map, '')
                },
                'hiddenItems': nodes_json.get(key, {}).get('hiddenItems', []),
                'name': {
                    'en': clean_html(n.get('en')),
                    'ja': clean_html(n.get('ja', '')),
                    'de': clean_html(n.get('de', '')),
                    'fr': clean_html(n.get('fr', '')),
                    'ko': clean_html(n.get('ko', '')),
                    'zh': clean_html(n.get('zh', ''))
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

dict = nodes_dict()
print(dict)