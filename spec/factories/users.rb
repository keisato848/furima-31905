FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'test00' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_kana             { 'ヤマダ' }
    first_kana            { 'タロウ' }
    birth_date            { '2020-01-01' }
  end
end
