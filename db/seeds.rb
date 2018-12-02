# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Monuments.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Monument.new
  t.monument_type = row['Monument Type']
  t.color = row['Color']
  t.single_or_double = row['Single or Double']
  t.length = row['length']
  t.width = row['width']
  t.height = row['height']
  t.price_cents = row['price']
  t.save
end