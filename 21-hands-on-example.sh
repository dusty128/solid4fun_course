# Your basic code you have is as the following:

# Filename: data_processor.py
###############################
import numpy as np
import pandas as pd

PROCESS_TYPE = 'normalize'
WINDOW_SIZE = 5
OUTPUT_FILE = 'output.csv'

def normalize_data(data):
    min_val = np.min(data)
    max_val = np.max(data)
    return (data - min_val) / (max_val - min_val)

def smooth_data(data, window_size=5):
    return pd.Series(data).rolling(window=window_size).mean().values

def process_data(input_file):
    data = pd.read_csv(input_file)
    if PROCESS_TYPE == 'normalize':
        data_processed = data.apply(normalize_data)
    elif PROCESS_TYPE == 'smooth':
        window_size = WINDOW_SIZE
        data_processed = data.apply(smooth_data, window_size=window_size)
    data_processed.to_csv(OUTPUT_FILE, index=False)

process_data('input.csv')
################################

###### Setup Directory Structure and basic files ########
# How would you do it?














# First build your package structure
# Create directories - best within your PyCharm project
mkdir my_processor
cd my_processor
mkdir my_processor
# For test data
mkdir data

cd my_processor
# Create empty __init__.py file so that the directory is recognized as a package

# Cut and paste above code into file "data_processor.py"

cd ../data
# Copy "input.csv" (from data directory) into this directory
# Test your basic script

# Add a README.md


###### Version Control ########
# Put your code under version control
# How would it be done?

















# Go into the top directory of your code
git init
git add .
git commit -m "initial commit"



















########### Virtual Environmen ###############
# Create venv
python -m venv myenv
# Activate it
source myenv/bin/activate

# Install numpy and pandas (I know, they are already there, nevertheless)
pip install numpy
pip install pandas

# Now freeze your packages
pip freeze > requirements.txt



############ commit ##############
# Now is a good time to commit this version
# Check status of git in main directory
git status

# Add all files needed under version control
git add <files>
# And commit
git commit . -m "added requirements"


############# Testing ###############
# Let's create simple doctests right in the docstring of the function:
# For normalize_data and smooth_data
# For smooth data:
# input is np.array([1, 2, 3, 4, 5], window size=3
# output is then: array([nan, nan,  2.,  3.,  4.])
#
# For normalize_data:
# input is np.array([1, 2, 3])
# output is - what do you think?
# How would you write the doctests? And how would you run them?






















def normalize_data(data):
    """
    Normalize the data.

    >>> normalize_data(np.array([1, 2, 3]))
    array([0. , 0.5, 1. ])

    """
    min_val = np.min(data)
    max_val = np.max(data)
    return (data - min_val) / (max_val - min_val)

def smooth_data(data, window_size=5):
    """
    Smooth the data using a rolling average.

    >>> smooth_data(np.array([1, 2, 3, 4, 5]), window_size=3)
    array([nan, nan,  2.,  3.,  4.])

    """
    return pd.Series(data).rolling(window=window_size).mean().values




















# Before running the doctests, you have to put code in __main__
def main():
    process_data('input.csv')

if __name__ == '__main__':
    main()

# Now you can run it with
python -m doctest data_processor.py


#### Commit again ####
git status
# Eventually add
git commit . -m "added doctests"



################## Program arguments ################
# It would be great to be able to call our script with some options, let's do that:
# The first argument should be the input file
# The second argument should be the output file
# --process should be used to "normalize" or "smooth" our data
# --log should specify the loglevel, default should be INFO
# --config specify the location of our configuration file

# Try it out!




















# We first have to import argparse
import argparse

# Right after main() let's initialize our parser:

parser = argparse.ArgumentParser(description='Process experimental data.')
parser.add_argument('input_file', help='Path to input CSV file')
parser.add_argument('output_file', help='Path to output CSV file')
parser.add_argument('--process', choices=['normalize', 'smooth'], default='normalize',
                    help='Type of processing to apply')
parser.add_argument('--config', default='config.ini', help='Path to configuration file')
parser.add_argument('--log', default='INFO', help='Logging level')

args = parser.parse_args()

# Of course, we can now call process_data() with our input file from the command line

# Process data
process_data(args.input_file, args.output_file, args.process, config)

# The function definition for process_data will change, too:
def process_data(input_file, output_file, process_type):

# And we don't need the global variable PROCESS_TYPE and OUTPUT_FILE

# Try it out!

python data_processor.py ../data/input.csv output.csv --process smooth
python data_processor.py ../data/input.csv output.csv --process normalize

# check the output files

# Run a doctest and commit the code

python -m doctest data_processor.py


#### Commit again ####
git status
# Eventually add
git commit . -m "added argument parsing"



########### Configuration #########
# Let's now configure the window size in an .INI-File.
# The file should look like this:
# name: config.ini
[DEFAULT]
window_size = 5

# How would you do that?




















# Put the contents of the ini-file alongside the data_processor.py

# Import at beginning of the file
import configparser

# Some load configuration function is always useful

def load_config(config_file):
    config = configparser.ConfigParser()
    config.read(config_file)
    return config

# O.k., now we need add code to main():
def main():
    # Load configuration
    config = load_config(args.config)

    # Process data
    process_data(input_file, output_file, process_type, config)

# We now need to apply the config data to the smooth_data function
    elif process_type == 'smooth':
        window_size = config.getint('DEFAULT', 'window_size', fallback=5)
        data_processed = data.apply(smooth_data, window_size=window_size)

# We can now dump the global variable "WINDOW_SIZE"

##### Now test it and commit
python -m doctest data_processor.py
git status
git commit -m "added configuration"


############### Logging ##################
# Great, now add some kind of logging to our program
# Let's log every data processing with level "INFO" at the start of process_data
# And log and "INFO" that the output file has been written.
# In case someone tries to call our data processing with something other than smooth / normalize
# Log an "ERROR"

# Try it out























# First we will have to configure our logger, import sys, too
import logging
import sys

# Now let's initialize the logger
# Configure logging - __name__ is for the current module
logger = logging.getLogger(__name__)

def setup_logging(log_level):
    logging.basicConfig(
        filename='data_processor.log',
        level=log_level,
        format='%(asctime)s %(levelname)s:%(message)s'
    )

# Now add some logging to our process_data() function:
def process_data(input_file, output_file, process_type, config):
    logger.info(f"Processing {input_file} with {process_type}")
    data = pd.read_csv(input_file)
    if process_type == 'normalize':
        data_processed = data.apply(normalize_data)
    elif process_type == 'smooth':
        window_size = config.getint('DEFAULT', 'window_size', fallback=5)
        data_processed = data.apply(smooth_data, window_size=window_size)
    else:
        logger.error(f"Unknown process type: {process_type}")
        sys.exit(1)
    data_processed.to_csv(output_file, index=False)
    logger.info(f"Data written to {output_file}")

# And don't forget to call the setup_logging function, e.g. in main() right after argument processing

# Setup logging
setup_logging(args.log.upper())



# Once again test it thoroughly, check if the logging happens
# Run doctests and commit
python -m doctest data_processor.py
git status
git commit -m "added configuration"



############## Packaging ###############
# Now let's make a python package
# What has to be done?


























# We first need a setup.py file

from setuptools import setup, find_packages

setup(
    name='my_processor',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'numpy',
        'pandas',
    ],
    entry_points={
        'console_scripts': [
            'process-data = my_processor.data_processor:main',
        ],
    },
    author='Your Name',
    author_email='your.email@example.com',
    description='A command-line tool to process experimental data.',
    url='https://github.com/yourusername/my_data_processor',
)

# You could also add a LICENSE file

# Then we can right away create the package and install in our virtualenv
pip install .

# BTW., you can also list all installed packages:
pip list

# Now we should be able to call our script like this:
process-data data/input.csv output.csv --process normalize

# Now you could distribute your package via PyPi
