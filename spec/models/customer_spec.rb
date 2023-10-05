# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  it "has a valid factory" do
    expect(create(:customer)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:name)) }
  it { is_expected.to(validate_presence_of(:address)) }
  it { is_expected.to(belong_to(:primary_contact)) }
  it { is_expected.to(belong_to(:billing_contact)) }
end
