task create_teachers: :environment  do
  3.times do
    Teacher.create!({
      prefix: Faker::Name.prefix, #=> "Mr."
      name: Faker::Name.name,
      grade: "3",
      email: Faker::Internet.email,
      user_id: 1
    })

  end
puts "3 teachers created.  All have been set to user_id 1 which should correspond to the first user id you create."
end