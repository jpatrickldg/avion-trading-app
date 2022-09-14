FactoryBot.define do
  factory(:user) do
    email { "pat@example.com" }
    password { "SecretPassword123" }
    role { "trader" }
    first_name { "trader" }
    last_name { "trader" }
    is_active { true }
    confirmed_at { Time.now }
  end
end