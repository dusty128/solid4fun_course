# We have some inefficient code in 17-profiling_code.py
# Let's check that out

# First we use cProfile from the command line
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

