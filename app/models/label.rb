# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :task_labels
  has_many :tasks, through: :task_labels

  validates :label_name, presence: true, length: { maximum: 10 }
end
