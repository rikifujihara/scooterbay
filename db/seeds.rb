# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    { email: 'rikifujihara@gmail.com', username: 'rikifujihara', first_name: 'Riki', admin: true}
]

users.each do |user|
    this_user = User.where(
        email: user[:email],
    ).first_or_initialize

    this_user.update!(
        username: user[:username],
        first_name: user[:first_name],
        admin: user[:admin],
        password: 123456
    )
    this_user.save
end

categories = ["Off-Road", "High-Speed", "Commuter", "Kids"]

if Category.count == 0
    categories.each do |category|
        Category.create(name: category)
    end
end
