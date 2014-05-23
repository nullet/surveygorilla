
#create new user john
john = User.create(username: "John", email: "john@email.com")
jane = User.create(username: "Jane", email: "jane@email.com")
#set password
john.password = "password"
jane.password = "password"

#John creates a new survey
test_survey = Survey.create(title: "Test Survey Title")
john.surveys << test_survey

#create question for survey
favorite_food = Question.create(text: "Favorite Food")
test_survey.questions << favorite_food

#add four choices to survey
a = Choice.create(text: "Sushi")
b = Choice.create(text: "Pasta")
c = Choice.create(text: "Chocolate")
d = Choice.create(text: "Pizza")

favorite_food.choices << a
favorite_food.choices << b
favorite_food.choices << c
favorite_food.choices << d

#jane takes a food survey
janes_results = Completion.create(survey_id: 1, user_id: 2)
jane_answer = Answer.create(choice_id: 3, completion_id: 1)
