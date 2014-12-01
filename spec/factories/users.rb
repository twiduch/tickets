FactoryGirl.define do
  factory :user do
    username "John"
    password  "kkkooo"
    first_name 'John'
  end
  
  factory :user2, parent: :user do
    username "Mata"
    password  "juhnpo"
    first_name 'Romo'
  end
end
