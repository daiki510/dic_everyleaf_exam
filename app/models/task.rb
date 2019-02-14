class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {maximum: 100}
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  #優先順位に対してenumを使用
  enum priority:[:低, :中, :高]

  #scope: 絞り込み検索機能
  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :sort_priority, -> { order(priority: :desc) }
  scope :sort_create, -> { order(created_at: :desc) }
  scope :search_with_title, -> (title){ where('title LIKE ?' , "%#{title}%") }
  scope :search_with_status, -> (status){ where('status LIKE ?' , "%#{status}%") }
  scope :search_with_label, -> (label_id){ where(id: label_ids = TaskLabel.where(label_id: label_id).pluck(:task_id))}

  #UserモデルとTaskモデルの紐付け
  belongs_to :user, optional: true

  #Labelモデルと紐付け
  has_many :task_labels
  has_many :labels, through: :task_labels
end
