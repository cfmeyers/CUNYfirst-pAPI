# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instructor do
    last_name "Smith"
    first_name "Melvin"
    cfid "123"
  end
end
