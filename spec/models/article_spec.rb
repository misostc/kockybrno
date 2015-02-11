require 'rails_helper'

describe Article do
  context 'with text and title' do
    it 'is valid' do
      expect(FactoryGirl.create(:article)).to be_valid
    end

    it 'is sorted by newest first' do
      article1 = FactoryGirl.create(:article, created_at: Time.now - 1.month)
      article2 = FactoryGirl.create(:article, created_at: Time.now)
      expect(Article.all).to eq([article2, article1])
    end
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:article, title: nil)).not_to be_valid
  end

  it 'is invalid without text' do
    expect(FactoryGirl.build(:article, text: nil)).not_to be_valid
  end
end
