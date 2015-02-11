require 'rails_helper'

describe Document do
  context 'with title and document' do
    it 'is valid' do
      expect(FactoryGirl.create(:document)).to be_valid
    end

    it 'is sorted by newest first' do
      document1 = FactoryGirl.create(:document, created_at: Time.now - 1.month)
      document2 = FactoryGirl.create(:document, created_at: Time.now)
      expect(Document.all).to eq([document2, document1])
    end
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:document, title: nil)).not_to be_valid
  end

  it 'is invalid without document' do
    expect(FactoryGirl.build(:document, document: nil)).not_to be_valid
  end

  it 'is invalid with wrong file type' do
    expect(FactoryGirl.build(:document, document: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test.png", 'image/png'))).not_to be_valid
  end
end
