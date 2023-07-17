require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'has a valid factory' do
    expect(create(:customer)).to be_valid
  end

  it {is_expected.to(validate_presence_of(:name))}
  it {is_expected.to(validate_presence_of(:address))}
  it {is_expected.to(validate_presence_of(:primary_contact))}
  it {is_expected.to(validate_presence_of(:billing_contact))}
end
