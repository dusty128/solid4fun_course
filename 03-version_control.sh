# Step 0: Configure git
git config --global user.email "<your-email>"
git config --global user.name "<your name>"

# Step 1: Clone the repository
git clone https://github.com/dusty128/test-repo.git
cd test-repo

# Step 2: Add some files
echo "print('Hello, Solid4Fun!')" > hello.py
echo "# Sample README" > README.md

# Step 3: Stage, commit, and push changes
git add .
git commit -m "Initial commit with hello.py and README.md"
echo "Pushing changes to the remote repository..."
git push origin main

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
