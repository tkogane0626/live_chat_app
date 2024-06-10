FactoryBot.define do
  factory :user do
    name { 'foobar' }
    email { 'foobar@example.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
