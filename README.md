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

<br>

## herokuへのデプロイ方法
1. `rails assets:precompile RAILS_ENV=production`<br>
→ アセットを事前にコンパイル（実際に実行できる形式に変換）する
2. gitを最新状態へ masterへpushまで実行
3. `heroku login (--interactive)`<br>
→ IDとパスワードを入力
4. `heroku create`
5. `git push heroku master`
6. `heroku run rails db:migrate`<br>
→ herokuへデータベースの移行

<br>

## 開発環境
Rails 5.2.2

Ruby 2.5.3

Bunlder 2.0.1

Rspec-rails 3.8.2
