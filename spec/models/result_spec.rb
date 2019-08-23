require "rails_helper"

RSpec.describe Result, type: :model do
  let(:user) {FactoryBot.create :user}
  let(:course) {FactoryBot.create :course, user_id: user.id}
  subject {FactoryBot.create :result, user_id: user.id, course_id: course.id}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:grade).of_type :float}
    it {is_expected.to have_db_column(:answers).of_type :text}
    it {is_expected.to have_db_column(:status).of_type :integer}
  end

  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :course}
  end
end
