import argparse
import configparser
import logging
import sys

import numpy as np
import pandas as pd

# Configure logging
logger = logging.getLogger(__name__)

def setup_logging(log_level):
    logging.basicConfig(
        filename='data_processor.log',
        level=log_level,
        format='%(asctime)s %(levelname)s:%(message)s'
    )

def load_config(config_file):
    config = configparser.ConfigParser()
    config.read(config_file)
    return config

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

def main():
    parser = argparse.ArgumentParser(description='Process experimental data.')
    parser.add_argument('input_file', help='Path to input CSV file')
    parser.add_argument('output_file', help='Path to output CSV file')
    parser.add_argument('--process', choices=['normalize', 'smooth'], default='normalize',
                        help='Type of processing to apply')
    parser.add_argument('--config', default='config.ini', help='Path to configuration file')
    parser.add_argument('--log', default='INFO', help='Logging level')

    args = parser.parse_args()

    # Setup logging
    setup_logging(args.log.upper())

    # Load configuration
    config = load_config(args.config)

    # Process data
    process_data(args.input_file, args.output_file, args.process, config)

if __name__ == '__main__':
    main()

