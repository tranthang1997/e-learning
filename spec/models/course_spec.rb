require "rails_helper"

RSpec.describe Course, type: :model do
  let(:user) {FactoryBot.create :user}
  subject {FactoryBot.create :course, user_id: user.id}


  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:description).of_type :text}
  end

  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to have_many(:words).dependent :destroy}
    it {is_expected.to have_many(:results).dependent :destroy}
  end
end
