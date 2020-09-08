FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { Faker::Internet.free_email }
    password              { '00000000' }
    password_confirmation { password }
    last_name             { 'あべ' }
    first_name            { 'たろう' }
    last_name_furigana    { 'アベ' }
    first_name_furigana   { 'タロウ' }
    birthday              { '1996-02-09' }
  end
end
