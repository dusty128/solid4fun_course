# Configure git
git config --global user.email "<your-email>"
git config --global user.name "<your name>"

# Clone the solid4fun repository
git clone https://github.com/dusty128/solid4fun_code.git
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
git commit . -m "Test"
# We see that there are no changes
git status

# Now let's have a look at the commits we did for this file, should be two
git log -- README.md

# And have a look at the changes
git log -p -- README.md

# Great, now let's revert it to the first version
# We note the hash of the commit and use that to restore the file
git restore --source=<hash> -- README.md

# Step 4: Demonstrate resolving a version conflict
echo "Simulating a version conflict..."
# Simulating a conflicting change by making a local change
echo "print('Hello, World!')" > hello.py
git commit -am "Local change to hello.py"

# Simulate a conflict: pretend another change happened remotely
# For this simulation, assume another change is made remotely
# In reality, someone else might push a conflicting change

# To simulate, let's fetch and simulate a conflict
git fetch origin main
# Assuming conflicting change was pushed remotely, attempt to pull changes
echo "Attempting to pull changes to create a conflict..."
git pull origin main

# Resolve the conflict manually in hello.py by editing it, then continue
echo "Resolving conflict..."
# Assuming a conflict is in hello.py, manually edit the file to resolve it
# For demonstration purposes, we assume you resolve it by keeping both lines:
# print('Hello, GitHub!')
# print('Hello, World!')

# After resolving, stage the resolved file
git add hello.py
# Finalize the conflict resolution with a commit
git commit -m "Resolved conflict in hello.py"
# Push the resolved changes
git push origin main

# Step 5: Create a branch, change something, and merge the branch
echo "Creating a new branch 'feature-branch'..."
git checkout -b feature-branch

# Make a change in the new branch
echo "print('This is a new feature!')" > feature.py
git add feature.py
git commit -m "Added feature.py in feature-branch"

# Switch back to the main branch
echo "Switching back to the main branch..."
git checkout main

# Merge the feature branch into the main branch
echo "Merging 'feature-branch' into 'main'..."
git merge feature-branch

# Push the merge result
echo "Pushing merged changes to the remote repository..."
git push origin main

# Optional: Clean up by deleting the feature branch locally and remotely
git branch -d feature-branch
git push origin --delete feature-branch

echo "Script completed successfully!"
