FactoryGirl.define do
  factory :article do
    title 'MyString'
    text 'MyText'
  end

  factory :document do
    title 'MyString'
    document Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/helloworld.pdf", 'application/pdf')
  end

  factory :kitten do
    sex 'MyString'
    breed 'MyString'
    station 'MyString'
    description 'MyText'
    born_at '2015-02-10'
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test.png", 'image/png')
    user
  end

  factory :photogallery do
    name 'MyString'
  end

  factory :photo do
    title 'MyString'
    alt_text 'MyString'
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test.png", 'image/png')
    photogallery
  end

  factory :region do
    name 'MyString'
    content 'MyText'
  end

  factory :tomcat do
    name 'MyString'
    tests 'MyString'
    breed 'MyString'
    station 'MyString'
    born_at '2015-02-10'
    ems 'MyString'
    description 'MyText'
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test.png", 'image/png')
    user
  end

  factory :user do
    sequence(:first_name) { |n| "janko#{n}" }
    sequence(:last_name) { |n| "hrasko#{n}" }
    email { "#{first_name}.#{last_name}@kockybrno.cz".downcase }
    password 'MyString'
    password_confirmation 'MyString'
    species 'MyString'
    prefix_title 'MyString'
    suffix_title 'MyString'
    location 'MyString'
    website 'MyString'
  end
end
