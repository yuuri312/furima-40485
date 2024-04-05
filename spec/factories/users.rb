FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'0000aa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'タロウ'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birthday              {'1900-01-30'}
    

  end
end