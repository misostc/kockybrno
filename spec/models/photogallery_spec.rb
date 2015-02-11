require 'rails_helper'

describe Photogallery do
  it 'is valid with name' do
    expect(FactoryGirl.build(:photogallery)).to be_valid
  end

  it 'is invalid without name' do
    expect(FactoryGirl.build(:photogallery, name: nil)).not_to be_valid
  end
end
