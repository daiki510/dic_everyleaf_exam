# README

## Model

>### Userモデル


|    カラム名     | データ型 |     日本語     |
| :-------------: | :------: | :------------: |
|       id        | integer  |   ユーザーID   |
|      name       |  string  |      名前      |
|      email      |  string  | メールアドレス |
| password_digest |  string  |   パスワード   |

>### Taskモデル
  
| カラム名 | データ型 |   日本語   |
| :------: | :------: | :--------: |
|    id    | integer  |  タスクID  |
| user_id  | integer  | ユーザーID |
|  title   |  string  |  タイトル  |
| content  |   text   |    内容    |
| deadline |   date   |  終了期限  |
|  status  |  string  |  進捗状況  |
| priority |  string  |  優先順位  |

>### Labelモデル

|  カラム名  | データ型 |  日本語  |
| :--------: | :------: | :------: |
|     id     | integer  | ラベルID |
| label_name |  string  | ラベル名 |

>### Task_labelモデル

| カラム名 | データ型 |      日本語      |
| :------: | :------: | :--------------: |
|    id    | integer  | タスク・ラベルID |
| task_id  | integer  |     タスクID     |
| label_id | integer  |     ラベルID     |




