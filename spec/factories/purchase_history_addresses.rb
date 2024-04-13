FactoryBot.define do
  factory :purchase_history_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { "3" }
    city { '千葉県流山市' }
    block { '赤山1-1' }
    building { '福岡ハイツ' }
    tel { '09012345678' }
  end
end