# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

# genreの登録
CSV.foreach('db/categories.csv') do |info|
  Category.create(:category_name => info[0])
end


# Spotの登録
# CSV.foreach('db/products.csv') do |info|
#   Product.create(:title => info[0], :kana => info[1], :price => info[2], :release_date => info[3],
#    :scene_id => info[4], :genre_id => info[5], :label_id => info[6], :stock => info[7], :artist_id => info[8])
# end
