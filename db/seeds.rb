User.create!(name: "admin",
             email: "admin@gmail.com",
             password: "111111",
             password_confirmation: "111111",
             is_admin: true)
User.create!(name: "member",
             email: "member@gmail.com",
             password: "111111",
             password_confirmation: "111111",
             is_admin: false)
Course.create!(name: "New course1",
               description: "course description",
               user_id: 1)
Course.create!(name: "New course2",
               description: "course description",
               user_id: 1)
Course.create!(name: "New course3",
               description: "course description",
               user_id: 1)
Course.create!(name: "New course3",
               description: "course description",
               user_id: 1)

Word.create!(course_id: 1,
             name: "place",
             meaning: "Địa điểm",
             speech: "place",
             example: "This is phone")
Word.create!(course_id: 1,
             name: "knife",
             meaning: "Con dao",
             speech: "knife",
             example: "This is knife")

Question.create!(word_id: 1,
                 question: "What is past tense of  place?",
                 correct_answer: 1)
Answer.create!(question_id: 1,
               content: "Placed")
Answer.create!(question_id: 1,
               content: "Plased")
Answer.create!(question_id: 1,
               content: "Plasis")
Answer.create!(question_id: 1,
               content: "Placing")

Question.create!(word_id: 1,
                 question: "What is the plural form a knife?",
                 correct_answer:5)
Answer.create!(question_id: 2,
               content: "Knifes")
Answer.create!(question_id: 2,
               content: "Knives")
Answer.create!(question_id: 2,
               content: "Nifes")
Answer.create!(question_id: 2,
               content: "Nives")

Question.create!(word_id: 1,
                 question: "What is the plural form a knife?",
                 correct_answer: 9)
Answer.create!(question_id: 3,
               content: "Knifes")
Answer.create!(question_id: 3,
               content: "Knives")
Answer.create!(question_id: 3,
               content: "Nifes")
Answer.create!(question_id: 3,
               content: "Nives")

Question.create!(word_id: 1,
                 question: "What is the plural form a knife?",
                 correct_answer: 13)
Answer.create!(question_id: 4,
               content: "Knifes")
Answer.create!(question_id: 4,
               content: "Knives")
Answer.create!(question_id: 4,
               content: "Nifes")
Answer.create!(question_id: 4,
               content: "Nives")

Question.create!(word_id: 1,
                 question: "What is the plural form a knife?",
                 correct_answer: 17)
Answer.create!(question_id: 5,
               content: "Knifes")
Answer.create!(question_id: 5,
               content: "Knives")
Answer.create!(question_id: 5,
               content: "Nifes")
Answer.create!(question_id: 5,
               content: "Nives")

Question.create!(word_id: 1,
                 question: "What is the plural form a knife?",
                 correct_answer: 21)
Answer.create!(question_id: 6,
               content: "Knifes")
Answer.create!(question_id: 6,
               content: "Knives")
Answer.create!(question_id: 6,
               content: "Nifes")
Answer.create!(question_id: 6,
               content: "Nives")
