# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    expect(create(:item)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:position)) }
  it { is_expected.to(validate_presence_of(:item_no)) }
  it { is_expected.to(validate_presence_of(:description)) }
  it { is_expected.to(validate_presence_of(:sales_order_no)) }
  it { is_expected.to(validate_presence_of(:unit)) }
  it { is_expected.to(validate_numericality_of(:position)) }
end
