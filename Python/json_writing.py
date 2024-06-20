import html
import json
import re

def load_json_file(file_path: str):
    with open(f"./Python/item/{file_path}", mode='r', encoding='utf-8') as file:
        data = json.load(file)
    return data

def write_json_to_file(data, file_path: str):
    with open(file_path, mode='w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=2)

def clean_html(text: str) -> str:
    # Convert HTML entities to correct characters
    text = html.unescape(text)
    # Replace <br> tags with /n characters
    text = text.replace('<br>', '\n').replace('<br/>', '\n')
    # Remove all other HTML tags
    text = re.sub(r'<.*?>', '', text)
    # Return sanitized text
    return text

