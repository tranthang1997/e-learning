require "rails_helper"

RSpec.describe Question, type: :model do
  let(:user) {FactoryBot.create :user}
  let(:course) {FactoryBot.create :course, user_id: user.id}
  let(:word) {FactoryBot.create :word, course_id: course.id}
  subject {FactoryBot.create :question, word_id: word.id}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:question).of_type :string}
    it {is_expected.to have_db_column(:correct_answer).of_type :integer}
  end

  context "associations" do
    it {is_expected.to have_many(:answers).dependent :destroy}
    it {is_expected.to belong_to :word}
  end
end
