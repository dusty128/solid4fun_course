# Configure git
git config --global user.email "<your-email>"
git config --global user.name "<your name>"

# Clone the solid4fun repository which we will use during the course
git clone https://github.com/dusty128/solid4fun_course.git
cd solid4fun_code

# Now open the pycharm editor and use this project
# For the Name use "solid4fun_course"
# Custom Environment
# (create from existing sources)

# Open the file "03-version_control.sh"

# O.k., let's play around with git first
# Open (Power)shell, create some directory and create git environment
mkdir git-example
cd git-example

# Initialize git
git init

# .git has been created (dir -Force / ls -la)

# Add some files with some editor (e.g. nano, vim, notepad)
nano hello.py
#->  print ("Hello, Solid4Fun!")
nano README.md
#-> Sample README

# You python file should execute:
python hello.py

# Stage, and commit
git add .
git commit -m "Initial commit with hello.py and README.md"
# Theoretically you could now push (=upload) your code to a remote repository
# -> We don't have any, so we won't do so
### git push origin main

# Now let's change a file
nano README.md
# -> Apply some changes and save
# Show status
git status

# Undo the changes and go back to the last commit
git restore Readme.md

# Now let's change the file again
nano README.md
# -> Apply some changes and save

# Now let's commit it
git commit . -m "Change README.md"
# We see that there are no changes
git status

# Now let's have a look at the commits we did for this file, should be two
git log -- README.md

# And have a look at the changes
git log -p -- README.md

# Great, now let's revert it to the first version
# We note the hash of the commit and use that to restore the file
git restore --source=<hash> -- README.md

# What happens in case a file is changed in the remote repository
# and also locally?
# [I change something in somefile.txt] and push changes ...
# You change something in somefile.txt

# Now pull changes from remote repository
# -> Version conflict

# This conflict has to be resolved manually
# You could now restore the original file and pull again
git restore somefile.txt
git pull somefile.txt
