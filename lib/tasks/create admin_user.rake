task create_admin_user: :environment do
  puts "1 admin user created"
  User.create!({
    email: 'admin@gmail.com',
    password: "password",
    admin_status: 1,
    first_name: 'Lindsay',
    last_name: 'Williams',
    
  })
end
