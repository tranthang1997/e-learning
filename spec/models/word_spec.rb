require "rails_helper"

RSpec.describe Word, type: :model do
  let(:user) {FactoryBot.create :user}
  let(:course) {FactoryBot.create :course, user_id: user.id}
  subject {FactoryBot.create :word, course_id: course.id}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:meaning).of_type :string}
    it {is_expected.to have_db_column(:speech).of_type :string}
    it {is_expected.to have_db_column(:example).of_type :string}
  end

  context "associations" do
    it {is_expected.to have_many(:questions).dependent :destroy}
    it {is_expected.to have_many(:learnings).dependent :destroy}
    it {is_expected.to belong_to :course}
  end
end
