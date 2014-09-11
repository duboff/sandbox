require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'does have a factory' do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  context 'validations' do
  end
end
