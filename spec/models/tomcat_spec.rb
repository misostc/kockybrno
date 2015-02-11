require 'rails_helper'

describe Tomcat do
  it 'has valid factory' do
    expect(FactoryGirl.build(:tomcat)).to be_valid
  end

  it 'is not confirmed after creation' do
    FactoryGirl.create(:tomcat)
    expect(Tomcat.all.first.confirmed?).to eq(false)
    expect(Tomcat.all.where(confirmed: true)).to be_empty
  end

  it 'is invalid without user' do
    expect(FactoryGirl.build(:tomcat, user: nil)).not_to be_valid
  end

  it 'is invalid without description' do
    expect(FactoryGirl.build(:tomcat, description: nil)).not_to be_valid
  end

  it 'is invalid without image' do
    expect(FactoryGirl.build(:tomcat, image: nil)).not_to be_valid
  end

  it 'is invalid with wrong file type' do
    expect(FactoryGirl.build(:tomcat, image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/helloworld.pdf", 'application/pdf'))).not_to be_valid
  end

  it 'is invalid without name' do
    expect(FactoryGirl.build(:tomcat, name: nil)).not_to be_valid
  end

  it 'is ordered newest first' do
    tomcat1 = FactoryGirl.create(:tomcat, created_at: Time.now - 1.month)
    tomcat2 = FactoryGirl.create(:tomcat)
    expect(Tomcat.all).to eq([tomcat2, tomcat1])
  end
end
