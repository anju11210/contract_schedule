# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#NOTE:「!」を付けることでエラーが返ってくる（つけないとfalseが返ってくるのみで、原因がわかりにくい）
Admin.find_or_create_by!(email: "sample-email@admin") do |admin|
  admin.password = "admin1"
end

Customer.find_or_create_by!(email: "sample@one") do |customer|
  customer.first_name = "一郎"
  customer.last_name = "一"
  customer.first_name_kana = "イチロウ"
  customer.last_name_kana = "イチ"
  customer.address = "一県一市一区一町一丁目一番一号1111号室"
  customer.phone_number = "11111111111"
  customer.password = "customer1"
  customer.password_confirmation = "customer1"
end

Customer.find_or_create_by!(email: "sample@two") do |customer|
  customer.first_name = "二郎"
  customer.last_name = "二"
  customer.first_name_kana = "ジロウ"
  customer.last_name_kana = "ニ"
  customer.address = "二県二市二町二番一二号"
  customer.phone_number = "22222222222"
  customer.password = "customer2"
  customer.password_confirmation = "customer2"
end

Customer.find_or_create_by!(email: "sample@three") do |customer|
  customer.first_name = "三郎"
  customer.last_name = "三"
  customer.first_name_kana = "サブロウ"
  customer.last_name_kana = "サン"
  customer.address = "三県三市三町三番三号サンマンション303号室"
  customer.phone_number = "33333333333"
  customer.password = "customer3"
  customer.password_confirmation = "customer3"
end

Customer.find_or_create_by!(email: "sample@four") do |customer|
  customer.first_name = "四郎"
  customer.last_name = "四"
  customer.first_name_kana = "シロウ"
  customer.last_name_kana = "ヨン"
  customer.address = "四県四市四町四丁目四番四号"
  customer.phone_number = "44444444444"
  customer.password = "customer4"
  customer.password_confirmation = "customer4"
end

Customer.find_or_create_by!(email: "sample@five") do |customer|
  customer.first_name = "五郎"
  customer.last_name = "五"
  customer.first_name_kana = "ゴロウ"
  customer.last_name_kana = "ゴ"
  customer.address = "五県五市五町五番五号505号室"
  customer.phone_number = "55555555555"
  customer.password = "customer5"
  customer.password_confirmation = "customer5"
end

p "データを作成しました"

