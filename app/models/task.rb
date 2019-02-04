class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 150}
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
end
