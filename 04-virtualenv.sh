Lesson 1: Introduction to virtualenv
Concept 1: What is virtualenv?

virtualenv is a tool to create isolated Python environments. This means you can install packages in a project without affecting the global Python installation on your system. This is crucial for project isolation and dependency management.


# Install virtualenv (if not already installed)
pip install virtualenv

# Check the installation
virtualenv --version

Concept 2: Creating a Virtual Environment

You can create a virtual environment within your project folder. This environment will have its own Python interpreter and libraries.

bash

# Navigate to your project folder
mkdir my_project
cd my_project

# Create a virtual environment
virtualenv venv

# This creates a 'venv' folder with a new Python environment.

Concept 3: Activating the Virtual Environment

Once a virtual environment is created, you need to activate it.

bash

# On macOS/Linux
source venv/bin/activate

# On Windows
venv\Scripts\activate

After activation, your terminal should show the virtual environment name in the prompt, e.g., (venv).
Concept 4: Installing Packages Inside the Environment

Inside the virtual environment, you can install packages using pip. These packages will only be available within the environment.

bash

# Install a package, e.g., Flask
pip install flask

# List installed packages
pip freeze

Exercise 1: Setup Your First Virtual Environment

    Create a new directory for a project.
    Create a virtual environment inside the directory.
    Activate the environment and install a package (e.g., requests).
    Verify that the package is installed using pip freeze.

Lesson 2: Managing Dependencies in a Project
Concept 1: Freezing Requirements

To ensure that your project dependencies can be replicated, you need to list them in a requirements.txt file. This can be generated using pip freeze.

bash

# Generate a requirements.txt file with all installed packages
pip freeze > requirements.txt

Concept 2: Installing Dependencies from requirements.txt

If someone else wants to work on your project, they can install all the dependencies listed in your requirements.txt.

bash

# Install all packages listed in requirements.txt
pip install -r requirements.txt

Concept 3: Upgrading and Managing Packages

It’s essential to manage package versions properly to avoid compatibility issues.

bash

# Upgrade a package
pip install --upgrade flask

# Uninstall a package
pip uninstall flask

Exercise 2: Freeze and Install Dependencies

    Install multiple packages in your environment (e.g., numpy, flask).
    Freeze the installed packages into a requirements.txt.
    Create a new virtual environment, activate it, and install packages from requirements.txt.

Lesson 3: Project Organization
Concept 1: Basic Project Structure

A well-organized project structure is key to maintaining clean and manageable code.

bash

my_project/
├── venv/              # Virtual environment folder
├── src/               # Source code folder
│   └── main.py        # Your main Python script
├── tests/             # Test folder for unit tests
├── requirements.txt   # List of dependencies
└── README.md          # Project description

Concept 2: Writing a main.py Script

Inside your src/ folder, create a main.py file. This will serve as the entry point to your project.

python

# src/main.py

def main():
    print("Hello, this is your project running inside a virtual environment!")

if __name__ == "__main__":
    main()

Concept 3: Running the Project Inside the Virtual Environment

Once the environment is activated, you can run your main.py script.

bash

# Activate virtual environment and run the script
source venv/bin/activate
python src/main.py

Exercise 3: Build a Simple Project

    Create a project structure as described above.
    Write a simple script in main.py that prints a message.
    Ensure your virtual environment is activated and run the script.

Lesson 4: Best Practices for Virtual Environments and Project Management
Concept 1: Deactivating the Environment

After working in a virtual environment, you can deactivate it.

bash

# Deactivate the virtual environment
deactivate

Concept 2: Ignoring the venv Folder in Version Control

When using version control systems like Git, you should not include the venv folder. Instead, use .gitignore to ignore it.

bash

# Create a .gitignore file
venv/

Concept 3: Re-creating Environments

If you ever need to recreate the environment (e.g., on another machine), you can do so easily:

bash

# On a new machine
git clone your_project_repo
cd your_project

# Recreate the environment
virtualenv venv

# Activate and install dependencies
source venv/bin/activate
pip install -r requirements.txt

Exercise 4: Setup Git for Your Project

    Initialize a Git repository in your project.
    Create a .gitignore file and exclude the venv/ folder.
    Add and commit your project files.

Lesson 5: Advanced Topics (Extra Content)
Concept 1: Working with Multiple Environments

Sometimes you might work on multiple versions of the same project or different projects simultaneously. Tools like virtualenvwrapper or pyenv help manage multiple environments more effectively.

bash

# Install virtualenvwrapper (on macOS/Linux)
pip install virtualenvwrapper

# Set up environment variables and commands for virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# Create, activate, and manage environments more easily
mkvirtualenv project1
workon project1

Concept 2: Using .env Files for Environment Variables

In a real-world project, you may need to manage secrets and configurations. This can be done using a .env file.

bash

# Install python-dotenv to manage .env files
pip install python-dotenv

# Create a .env file
echo "API_KEY=12345" > .env

# Load variables from .env in your Python script
from dotenv import load_dotenv
import os

load_dotenv()
api_key = os.getenv("API_KEY")
print(api_key)  # Output should be: 12345

Exercise 5: Manage Environment Variables

    Install python-dotenv in your virtual environment.
    Create a .env file and load variables into your script.
    Print the loaded variables to confirm they're working.

Conclusion

By the end of this course, you should be comfortable creating Python projects with virtual environments, managing dependencies, and organizing your project structure. This ensures your Python projects are portable, maintainable, and isolated from system-level Python installations.

This course provides the foundational tools for working with Python in a professional manner, ensuring that projects are set up for success from the start. Let me know if you'd like to go deeper into any specific areas!