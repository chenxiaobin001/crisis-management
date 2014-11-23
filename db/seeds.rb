# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school_list = ["seas", "wharton", "medical", "law", "art"]


0.upto(10) do |index|
	User.create(
		pennkey: "taorui#{index}", 
		email: "taorui#{index}@seas.upenn.edu", 
		privilege: rand(0..2), 
		school: school_list[rand(0..4)]
		)
end

0.upto(4) do |index|
	Group.create(
		group_name: school_list[index]
		)
end

0.upto(10) do |index|
	Document.create(
		document_name: "document#{index}",
		url: "./document#{index}.pdf"
		)
end
