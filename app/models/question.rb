class Question < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
  reject_if: proc{|attributes| attributes[:content].blank?}

  scope :in_words, ->(arr_words_id){where word_id: arr_words_id}
  scope :rand, -> {order("RAND()")}

  QUESTION_PARAMS = [:word_id, :question, :correct_answer,
    answers_attributes: [:id, :content, :_destroy]].freeze

  scope :order_by_column, ->(column){order(column)}
  scope :include_word_name, ->{select "questions.*, words.name as word_name"}
  delegate :name, to: :word, prefix: true
end
