class TaskLabel < ApplicationRecord
  #Taskモデル&Labelモデルの中間テーブルとして紐付け
  belongs_to :task
  belongs_to :label
end
