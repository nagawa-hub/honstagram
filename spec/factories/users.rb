FactoryBot.define do
  factory :user do
    user_name             {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
  end
end