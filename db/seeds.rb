# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者ログイン用
#Admin内を探す：既にsample-email@adminが作られていないか
admin = Admin.find_by(email: 'sample-email@admin')
#もし作られていなかったら、新しく作成
Admin.create!(email: 'sample-email@admin',password: 'admin1') if admin.blank?

#会員ログイン用
customer = Customer.find_by(email: 'sample@one')
if customer.blank?
   Customer.create!(
      first_name: '一',
      last_name: '一郎',
      first_name_kana: 'イチ',
      last_name_kana: 'イチロウ',
      address: '一県',
      phone_number: "11111111111",
      email: 'sample@one',
      password: 'customer1',
      is_active: true
   )
end

customer = Customer.find_by(email: 'sample@tow')
if customer.blank?
   Customer.create!(
      first_name: '二',
      last_name: '二郎',
      first_name_kana: 'ニ',
      last_name_kana: 'ジロウ',
      address: '二県',
      phone_number: "22222222222",
      email: 'sample@tow',
      password: 'customer2',
      is_active: true
   )
end