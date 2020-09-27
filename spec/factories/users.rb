FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'a000000' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '太郎' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1984-07-10' }
  end
end
