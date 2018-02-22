require 'rails_helper'

RSpec.describe Trip, type: :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:trip)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :driver }
    it { is_expected.to validate_presence_of :state }
  end
end