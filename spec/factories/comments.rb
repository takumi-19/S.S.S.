FactoryBot.define do
  factory :comment do
    content   {Faker::Lorem.sentence}
    image     {File.open("#{Rails.root}/public/images/test_image.jpg")}
    supporter
    room
  end
end