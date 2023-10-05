# frozen_string_literal: true

require "rails_helper"

RSpec.describe WarehouseOrder, type: :model do
  it "has a valid factory" do
    expect(create(:warehouse_order)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:doc_no)) }
  it { is_expected.to(belong_to(:customer)) }
end
