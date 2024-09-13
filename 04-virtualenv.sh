# Hands-On Example for virtualenv

# Install virtualenv (we have it already installed)
pip install virtualenv

# Check the installation
virtualenv --version

# Navigate to your project folder
mkdir my_project
cd my_project

# Create a virtual environment
virtualenv venv

# This creates a 'venv' folder with a new Python environment.

# Activating the Virtual Environment
# On macOS/Linux
source venv/bin/activate
# On Windows
venv\Scripts\activate

# Terminal should show the virtual environment name in the prompt,
# e.g., (venv).

# Installing Packages Inside the Environment
# Install packages using pip. These packages will only be available
# within the environment.

# Install a package, e.g., Flask
pip install flask

# List installed packages
pip freeze

# Setup Your First Virtual Environment

# To ensure that your project dependencies can be replicated, you need
# to list them in a requirements.txt file. This can be generated
# using pip freeze.

# Generate a requirements.txt file with all installed packages
pip freeze > requirements.txt

# If someone else wants to work on your project, they can install
# all the dependencies listed in your requirements.txt.

# Install all packages listed in requirements.txt
pip install -r requirements.txt

# Upgrading and Managing Packages

# Upgrade a package
pip install --upgrade flask

# Uninstall a package
pip uninstall flask

# Basic Project Structure

A well-organized project structure is key to maintaining clean and manageable code.

bash

my_project/
├── venv/              # Virtual environment folder
├── src/               # Source code folder
│   └── main.py        # Your main Python script
├── tests/             # Test folder for unit tests
├── requirements.txt   # List of dependencies
└── README.md          # Project description

# Writing a main.py Script
# Inside your src/ folder, create a main.py file.
# This will serve as the entry point to your project.

# src/main.py

def main():
    print("Hello, this is your project running inside a virtual environment!")

if __name__ == "__main__":
    main()

# Running the Project Inside the Virtual Environment
# Once the environment is activated, you can run your main.py script.

# Activate virtual environment and run the script
source venv/bin/activate
python src/main.py

# After working in a virtual environment, you can deactivate it.

# Deactivate the virtual environment
deactivate

# Ignoring the venv Folder in Version Control

# When using version control systems like Git, you should not include
# the venv folder. Instead, use .gitignore to ignore it.

# Create a .gitignore file
venv/

# Re-creating Environments
# Typical example (powershell example)

# On a new machine
git clone https://github.com/dusty128/my_webserver
cd my_webserver

# Recreate the environment
virtualenv venv

# Activate and install dependencies
source venv/bin/activate
pip install -r requirements.txt

# Start example webserver
python src/main.py

# Browse to http://localhost:5000

# Stop server and deactivate environment
deactivate
