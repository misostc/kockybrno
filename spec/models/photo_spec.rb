require 'rails_helper'

describe Photo do
  context 'with text and title' do
    it 'is valid' do
      expect(FactoryGirl.create(:photo)).to be_valid
    end

    it 'is sorted by newest first' do
      photo1 = FactoryGirl.create(:photo, created_at: Time.now - 1.month)
      photo2 = FactoryGirl.create(:photo, created_at: Time.now)
      expect(Photo.all).to eq([photo2, photo1])
    end
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:photo, title: nil)).not_to be_valid
  end

  it 'is invalid without image' do
    expect(FactoryGirl.build(:photo, image: nil)).not_to be_valid
  end

  it 'is invalid without photogallery' do
    expect(FactoryGirl.build(:photo, photogallery: nil)).not_to be_valid
  end

  it 'is invalid with wrong file type' do
    expect(FactoryGirl.build(:photo, image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/helloworld.pdf", 'application/pdf'))).not_to be_valid
  end
end
