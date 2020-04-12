# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(name: "山田")
Subject.create(
    teacher_id: 1,
    title: "統計",
    weekday: 5,
    period: 3
)
Lecture.create(title: "確率", date: "2020-04-30", subject_id: 1)
Lecture.create(title: "ガイダンス", date: "2020-04-23", subject_id: 1)
