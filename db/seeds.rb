# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#「!」を付けることでエラーが返ってくる（つけないとfalseが返ってくるのみで、原因がわかりにくい）
Admin.find_or_create_by!(email: "sample-email@admin") do |admin|
  admin.password = "admin1"
end

Customer.find_or_create_by!(email: "sample@one") do |customer|
  customer.first_name = "一"
  customer.last_name = "一郎"
  customer.first_name_kana = "イチ"
  customer.last_name_kana = "イチロウ"
  customer.address = "一県"
  customer.phone_number = "11111111111"
  customer.password = "customer1"
end

Customer.find_or_create_by!(email: "sample@two") do |customer|
  customer.first_name = "二"
  customer.last_name = "二郎"
  customer.first_name_kana = "ニ"
  customer.last_name_kana = "ジロウ"
  customer.address = "二県"
  customer.phone_number = "22222222222"
  customer.password = "customer2"
end

p "データを作成しました"