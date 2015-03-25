task create_user: :environment do
  10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    admin_status: 0,
  })
  end
  User.create!({
    first_name: 'Lindsay',
    last_name: 'Williams',
    email: 'williamsl25@yahoo.com',
    password: "password",
    admin_status: 0,
  })
  end
end