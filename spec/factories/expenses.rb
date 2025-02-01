FactoryBot.define do
  factory :expense do
    name { "Internet Bill" }
    amount { 69.00 }
    date { Date.new(2025, 1, 31) }
    category { "Utilities" }
  end
end
