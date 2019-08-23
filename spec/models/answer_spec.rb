require "rails_helper"

RSpec.describe Answer, type: :model do
  let(:user) {FactoryBot.create :user}
  let(:course) {FactoryBot.create :course, user_id: user.id}
  let(:word) {FactoryBot.create :word, course_id: course.id}
  let(:question) {FactoryBot.create :question, word_id: word.id}
  subject {FactoryBot.create :answer, question_id: question.id}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:content).of_type :string}
  end

  context "associations" do
    it {is_expected.to belong_to :question}
  end
end
