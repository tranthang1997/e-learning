require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryBot.create :user}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:email).of_type :string}
    it {is_expected.to have_db_column(:is_admin).of_type :boolean}
  end

  context "associations" do
    it {is_expected.to have_many(:courses).dependent :destroy}
    it {is_expected.to have_many(:results).dependent :destroy}
    it {is_expected.to have_many(:learnings).dependent :destroy}
  end
end
