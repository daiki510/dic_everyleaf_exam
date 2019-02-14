class Label < ApplicationRecord
  validates :label_name, presence: true, length: {maximum: 10}

  #Taskモデルと紐付け
  has_many :task_labels
  has_many :tasks, through: :task_labels
end
