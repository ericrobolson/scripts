# This script is used for reseting a repo's entire history.

echo "Are you absolutely sure you want to do this?"
echo "Are you really absolutely sure?"
echo "Then type in the phrase on the next line:"
echo "  i understand and accept"
printf "  "
read input

if [[ $input == "i understand and accept" ]]; then
    git checkout --orphan newBranch
    git add -A  # Add all files and commit them
    git commit
    git branch -D master  # Deletes the master branch
    git branch -m master  # Rename the current branch to master
    git push -f origin master  # Force push master branch to github
    git gc --aggressive --prune=all     # remove the old files
else
    echo "Skipping reset."
fi
