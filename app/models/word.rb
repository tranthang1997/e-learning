class Word < ApplicationRecord
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :learnings, dependent: :destroy

  scope :order_by_column, ->(column){order(column)}

  WORD_PARAMS = %i(course_id name meaning speech example).freeze

  validates :course_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.words.max_length}
  validates :speech, presence: true, length: {maximum: Settings.words.max_length}
  validates :meaning, presence: true
  validates :example, presence: true

  delegate :name, to: :course, prefix: true
end
