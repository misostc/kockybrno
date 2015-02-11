require 'rails_helper'

describe Region do
  it 'has valid factory' do
    expect(FactoryGirl.build(:region)).to be_valid
  end

  it 'is invalid without name' do
    expect(FactoryGirl.build(:region, name: nil)).not_to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:region, content: nil)).not_to be_valid
  end

  describe 'get' do
    it 'retrieves existing region' do
      region = FactoryGirl.create(:region, name: 'region-name')
      expect(Region.get('region-name')).to eq(region)
    end

    it 'returns nil on non-existing region' do
      expect(Region.get('region-name')).to eq(nil)
    end
  end
end
