require 'rails_helper'

describe User do
  it 'has valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid without first name' do
    expect(FactoryGirl.build(:user, first_name: nil)).not_to be_valid
  end

  it 'is invalid without last name' do
    expect(FactoryGirl.build(:user, last_name: nil)).not_to be_valid
  end

  describe 'nice_name' do
    context 'without titles' do
      it 'writes out nice_name' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: nil, suffix_title: nil)
        expect(user.nice_name).to eq('Jan Novak')
      end
      it 'writes out nice_name with blank strings' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: '', suffix_title: '')
        expect(user.nice_name).to eq('Jan Novak')
      end
    end

    context 'with prefix title' do
      it 'writes out nice_name' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: 'Ing.', suffix_title: nil)
        expect(user.nice_name).to eq('Ing. Jan Novak')
      end
      it 'writes out nice_name with blank string' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: 'Ing.', suffix_title: '')
        expect(user.nice_name).to eq('Ing. Jan Novak')
      end
    end

    context 'with suffix title' do
      it 'writes out nice_name' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: nil, suffix_title: 'PhD.')
        expect(user.nice_name).to eq('Jan Novak, PhD.')
      end
      it 'writes out nice_name with blank string' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: '', suffix_title: 'PhD.')
        expect(user.nice_name).to eq('Jan Novak, PhD.')
      end
    end

    context 'with both titles' do
      it 'writes out nice_name' do
        user = FactoryGirl.build(:user, first_name: 'Jan', last_name: 'Novak', prefix_title: 'Ing.', suffix_title: 'PhD.')
        expect(user.nice_name).to eq('Ing. Jan Novak, PhD.')
      end
    end
  end
end
