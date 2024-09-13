import random
import time

# GONE
import timeit

def generate_data(size):
    data = []
    for _ in range(size):
        data.append(random.randint(1, 100))
    return data


def compute_average(data):
    # Inefficient summation
    total = 0
    for i in range(len(data)):
        total += data[i]
    average = total / len(data)
    return average


def remove_duplicates(data):
    # Inefficient duplicate removal
    unique_data = []
    for item in data:
        if item not in unique_data:
            unique_data.append(item)
    return unique_data


def sort_data(data):
    # Inefficient sorting algorithm (selection sort)
    sorted_data = data.copy()
    for i in range(len(sorted_data)):
        min_idx = i
        for j in range(i + 1, len(sorted_data)):
            if sorted_data[j] < sorted_data[min_idx]:
                min_idx = j
        sorted_data[i], sorted_data[min_idx] = sorted_data[min_idx], sorted_data[i]
    return sorted_data

@profile
def process_data(data):
    average = compute_average(data)
    unique_data = remove_duplicates(data)
    sorted_data = sort_data(unique_data)
    return average, sorted_data


def main():
    data_size = 1000000  # Adjust the size for more pronounced inefficiencies
    data = generate_data(data_size)

    start_time = time.time()
    average, sorted_data = process_data(data)
    end_time = time.time()

    print(f"Processed {data_size} data points in {end_time - start_time:.2f} seconds.")
    print(f"Average: {average}")
    print(f"First 10 sorted unique values: {sorted_data[:10]}")


if __name__ == "__main__":
    main()
