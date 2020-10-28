FactoryBot.define do
  factory :user do
    nickname              { 'aiueo' }
    email                 { 'aiueo@gmail.com' }
    password              { 'abcd123' }
    password_confirmation { 'abcd123' }
    first_name            { '矢まダ' }
    last_name             { '他ろウ' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '2002-02-02' }
  end
end
