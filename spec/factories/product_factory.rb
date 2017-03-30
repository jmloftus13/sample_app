FactoryGirl.define do


  sequence(:description) {|n|  "description of test_product_#{n}"}
  sequence(:name) {|n|  "test_product_#{n}"}
  sequence(:id) {|n|  "#{n}"}


  factory :product do
    id
    name
    description
    image_url "racebike.jpg"
    
    price "500"

  end

end