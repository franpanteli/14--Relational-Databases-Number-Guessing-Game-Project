# Relational-Databases-Number-Guessing-Game-Project
## Relational Databases Independent Learning
I independently completed [my fourteenth project](https://freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game) in freeCodeCamp's [Relational Databases course](https://www.freecodecamp.org/learn/relational-database/), to improve my shell scripting and SQL skills. This curriculum consisted of 14 guided projects, to be completed in a Gitpod environment. My notes outlining the names (et al) of these guided projects are [here](https://github.com/franpanteli/14--Relational-Databases-Number-Guessing-Game-Project/blob/main/0%20relational-databases-course-overview.txt). This repository is for the fourteenth project I completed as part of this.

## Number Guessing Game Bash Script
### Problem Solving
My notes on the full task brief for this are [here](https://github.com/franpanteli/14--Relational-Databases-Number-Guessing-Game-Project/blob/main/1%20project-task-notes.txt). For this project, I had to create a number guessing game which prompted users to enter their usernames and guess a number between 1 and 1, 000. This was comprised of a Bash script ([number_guess.sh](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sh)) and an SQL database ([number_guess.sql](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sql)) of previous users. If the user entered an incorrect guess for this, the script would indicate if it was too large or too small. This process was repeated until the user guessed the random number correctly. 

### Solution Workflow 
- To complete this project, I used the CodeRoad extension in a VSCode virtual machine with Gitpod. I exported the project requirements as a PDF and [annotated them with my problem-solving approaches](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/Task%20Challenge%20Notes.pdf)
- The project Bash file ([number_guess.sh](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sh)) was first created. Executable file permissions were set for this in a Bash prompt. The contents of this file were written in line with the [project requirements](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/Task%20Challenge%20Notes.pdf)
- The project SQL file ([number_guess.sql](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sql)) was then created. This stored information about the usernames entered during previous iterations that the project had been run in
- Tests were run on the files this produced ([number_guess.sh](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sh) and [number_guess.sql](https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project/blob/main/number_guess.sql)). These files were then exported from the project virtual machine and pushed to this repository once they had successfully passed 

## To Clone This Repository
```
git clone https://github.com/franpanteli/Relational-Databases-Number-Guessing-Game-Project.git
```
