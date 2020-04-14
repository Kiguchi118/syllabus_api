# シラバス検索サイト用のAPI
***
授業名と教師名で検索(部分一致)できる．

`http://localhost:3000/api/v1/lectures?teacher_name=山田&keyword=統計`

```
[
  {
    id: 1,
    title: "統計基礎",
    weekday: "friday",
    period: 3,
    teacher: {
      id: 1,
      name: "山田太郎"
     },
    lectures: [
      {
        id: 2,
        title: "ガイダンス",
        date: "2020-04-30"
      },
      {
        id: 1,
        title: "確率変数と確率分布",
        date: "2020-05-01"
      }
    ]
  }
]
```
