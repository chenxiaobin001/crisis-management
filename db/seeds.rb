# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(:pennkey => "taorui", :password => "123", :level => 1)
user2 = User.create(:pennkey => "hansong", :password => "123", :level => 2)
user3 = User.create(:pennkey => "xiaobin", :password => "123", :level => 3)