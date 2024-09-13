# We have some inefficient code in 17-profiling_code.py
# Let's have a look at what it does

# First guess: Which function do you think will take longest?
































# To analyze, first we use cProfile from the command line
python -m cProfile -s cumulative 17-profiling_code.py

# The result is hard to read.
# Moreover, the random functions need longest, however we are not interested in this.
# It seems that the slowest function is get_duplicates(), but let's user the line_profiler
# to get better results

# install line_profiler (conda seems to fail here)
pip install line_profiler

# Decorate function process_data() with @profile
# Now run the line profiler
kernprof -l -v 17-profiling_code.py

# The result is better, we see that the real problem is unique_data()
# Let's look into it by moving @profile to this function
# O.k., something is very slow here.
# -> Any suggestions how to speed up the code?






























# -> Use a set() instead of the loop:
def remove_duplicates(data):
    unique_data = list(set(data))
    return unique_data

# -> Wow, this speeds up things a lot
# Now the slowest function is compute_average()
# -> Any suggestions how to speedup things there?





























# Well, just use the built-in sum() function, which will hopefully be faster
def compute_average(data):
    total = sum(data)
    average = total / len(data)
    return average


# Interestingly, the sorting is still fast. Nevertheless, any idea to simplify and
# speedup this function?
































# Python provides the sorted() function just for that -> much easier and faster.

def sort_data(data):
    sorted_data = sorted(data)
    return sorted_data
