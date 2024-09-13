from setuptools import setup, find_packages

setup(
    name='solid4fun-handson',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'numpy',
        'pandas',
    ],
    entry_points={
        'console_scripts': [
            'process-data = solid4fun-handson.data_processor:main',
        ],
    },
    author='Your Name',
    author_email='your.email@example.com',
    description='A command-line tool to process experimental data.',
    url='https://github.com/yourusername/my_data_processor',
)

# Note the line "console_scripts" - this will generate a script that calls our function
# Now we can right away install this package into our virtualenv to test it out!
