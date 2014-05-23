![Schema](http://i.imgur.com/dibr1XM.png)

Git workflow:

- $ git checkout -b <branch name>
- commit early, commit often
- once done with a feature:
- $ git pull origin master
- $ git push origin <branch name>
- Create pull request in github for the branch
- Merge branch into master
- If creating a branch for every feature:
- $ git checkout master
- $ git merge <branch name> #this is the branch that was just pushed to the remote repo
- $ git branch -d <branch name> #deletes the branch
- Repeat entire process for a new feature