require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'has a valid factory' do
    expect(create(:contact)).to be_valid
  end

  it {is_expected.to(validate_presence_of(:name))}
  it {is_expected.to(validate_presence_of(:email))}
  it {is_expected.to(validate_presence_of(:phone_number))}
end
