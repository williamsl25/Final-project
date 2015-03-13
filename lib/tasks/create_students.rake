task create_students: :environment  do
  20.times do
    Student.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.between(8.years.ago, Date.today),
      strengths: Faker::Lorem.sentence,
      weaknesses: Faker::Lorem.sentence
      })

  end
puts "20 teachers created."
end