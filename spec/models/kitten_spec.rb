require 'rails_helper'

describe Kitten do
  it 'has valid factory' do
    expect(FactoryGirl.build(:kitten)).to be_valid
  end

  it 'is not confirmed after creation' do
    FactoryGirl.create(:kitten)
    expect(Kitten.all.first.confirmed?).to eq(false)
    expect(Kitten.all.where(confirmed: true)).to be_empty
  end

  it 'is invalid without user' do
    expect(FactoryGirl.build(:kitten, user: nil)).not_to be_valid
  end

  it 'is invalid without description' do
    expect(FactoryGirl.build(:kitten, description: nil)).not_to be_valid
  end

  it 'is invalid without image' do
    expect(FactoryGirl.build(:kitten, image: nil)).not_to be_valid
  end

  it 'is invalid with wrong file type' do
    expect(FactoryGirl.build(:kitten, image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/helloworld.pdf", 'application/pdf'))).not_to be_valid
  end

  it 'is ordered newest first' do
    kitten1 = FactoryGirl.create(:kitten, created_at: Time.now - 1.month)
    kitten2 = FactoryGirl.create(:kitten)
    expect(Kitten.all).to eq([kitten2, kitten1])
  end
end
