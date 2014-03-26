# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campus do
    sequence(:name) {|i| "Campus #{i}" }
    sequence(:campus_id) {|i| i }

    institution
  end
end
