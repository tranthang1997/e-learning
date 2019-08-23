class Result < ApplicationRecord
  belongs_to :course
  belongs_to :user

  scope :order_by_column, ->(column){order(column)}
  scope :where_column, ->(column: value){where(column: value)}

  delegate :name, :avatar, to: :user, prefix: true
  delegate :name, to: :course, prefix: true
end
