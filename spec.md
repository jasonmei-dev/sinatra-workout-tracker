# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Sinatra is used for the controllers to provide routing for the app
- [x] Use ActiveRecord for storing information in a database - Users, Workouts, and Exercises are all stored using ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) - There are 3 models: User, Workout, and Exercise
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Users have many workouts, and workouts have many exercises
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - A Workout belongs to a user, and an exercise belongs to a workout
- [x] Include user accounts with unique login attribute (username or email) - User model has validations for uniqueness of username and email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - There are CRUD routes for workouts and exercises
- [x] Ensure that users can't modify content created by other users - Users can only modify their own workouts and exercises
- [x] Include user input validations - There are input presence validations in all 3 models (User, Workout, Exercise)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Sinatra Flash was used to display error messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits - Admittedly I could've done commits more often. I will improve on this in the next project
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
