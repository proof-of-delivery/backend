require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid factory" do
    expect(build(:customer)).to be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:primary_contact)}


end
