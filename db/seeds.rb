# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# teachers_number = 2
# 2.times do
#     Teacher.create!(
#         name: Gimei.name.kanji
#     )
# end
##### 教師設定 #####
Teacher.create!(name: "山田太郎")
Teacher.create!(name: "佐藤次郎")

##### 科目と授業設定 #####
### 教師id:1の授業 ###
Subject.create!(
    teacher_id: 1,
    title: "統計基礎",
    weekday: 5,
    period: 3
)
Lecture.create!(title: "確率変数と確率分布", date: "2020-05-01", subject_id: 1)
Lecture.create!(title: "ガイダンス", date: "2020-04-30", subject_id: 1)

Subject.create!(
    teacher_id: 1,
    title: "多変量解析",
    weekday: 4,
    period: 2
)
Lecture.create!(title: "多変量解析とは", date: "2020-04-23", subject_id: 2)
Lecture.create!(title: "多次元分布の期待値", date: "2020-04-30", subject_id: 2)

### 教師id:2の授業 ###
Subject.create!(
    teacher_id: 2,
    title: "論理回路",
    weekday: 3,
    period: 2
)
Lecture.create!(title: "論理回路の基礎", date: "2020-04-22", subject_id: 3)
Lecture.create!(title: "N進数と符号体系", date: "2020-04-29", subject_id: 3)

Subject.create!(
    teacher_id: 2,
    title: "ディジタル通信工学",
    weekday: 3,
    period: 4
)
Lecture.create!(title: "ディジタル通信とは", date: "2020-04-22", subject_id: 4)
Lecture.create!(title: "身近な情報通信", date: "2020-04-29", subject_id: 4)
