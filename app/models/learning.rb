class Learning < ApplicationRecord
  belongs_to :user
  belongs_to :word

  delegate :name, :meaning, :speech, :example, to: :word, prefix: true
end
