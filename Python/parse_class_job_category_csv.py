import pandas as pd


swift_function = '''/// Returns a `ClassJobCategory` from a given ID.
private static func getClassJobCategoryFromId(_ id: Int) -> ClassJobCategory {
    switch id {
'''
end = '''    default: return ClassJobCategory(id: 0, name: "Unknown", classJobs: [])
    }
}
'''
df = pd.read_csv('Python/csv/ClassJobCategory.csv')

result = {}

for index, row in df.iterrows():
    key = row['key']
    name = row['name']

    try:
        key = int(key)
        if key == 0:
            continue
    except:
        continue

    if pd.isna(name):
        continue

    true_keys = [int(df.columns[i]) for i in range(2, len(df.columns)) if row[i] == 'True']

    result[key] = {
        'name': name,
        'true_keys': true_keys
    }

for k, v in result.items():
    if k == 0:
        continue
    swift_function += f"    case {k}: return ClassJobCategory(\n"
    swift_function += f"        id: {k},\n"
    swift_function += f"        name: \"{v['name']}\",\n"
    swift_function += f"        classJobs: [\n"
    for class_job_id in v['true_keys']:
        swift_function += f"            ClassJob(id: {class_job_id}),\n"
    swift_function += f"        ]\n"
    swift_function += f"    )\n"

swift_function += end

with open('Python/csv/ClassJobCategory.swift', 'w') as file:
    file.write(swift_function)