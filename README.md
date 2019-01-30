# README

## Model

>### Userモデル
* ID
* name: string (名前)
* email: string (メールアドレス)
* password_digest: string (パスワード)

>### Taskモデル
* ID
* user_id
* title: string (タイトル)
* content: text (内容)
* deadline: date (終了期限)
* status: string (進捗状況)
* priority: string (優先順位)

>### Labelモデル
* ID
* label_name: string (ラベル名)

>### Task_labelモデル
* ID
* task_id
* label_id



