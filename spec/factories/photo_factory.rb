FactoryGirl.define do
  factory :photo do
    sequence :image do |n|
      Rack::Test::UploadedFile.new("#{Rails.root}/spec/data/images/image#{n}.jpg")
    end
  end
end