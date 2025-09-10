FactoryBot.define do
  factory :user do
    nickname                { 'test' }
    email                   { Faker::Internet.email }
    password                { 'abc123' } 
    password_confirmation   { 'abc123' }
    last_name               { '佐藤' }
    first_name              { '太郎' }
    last_name_kana          { 'サトウ' }
    first_name_kana         { 'タロウ' }
    birthday                { '2000-01-01' }
  end
end
