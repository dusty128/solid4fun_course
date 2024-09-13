# Find the bug in the following program using a debugger

def flatten(lst):
    flat_list = []
    for item in lst:
        if isinstance(item, list):
            flat_list.extend(flatten(lst))
        else:
            flat_list.append(item)
    return flat_list

nested_list = [1, [2, [3, [4]], 5], 6]

print(flatten(nested_list))

