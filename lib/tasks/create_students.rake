task create_students: :environment  do
  10.times do

    Student.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.between(8.years.ago, Date.today),
      strengths: Faker::Lorem.sentence,
      weaknesses: Faker::Lorem.sentence,
      cbms: [Cbm.create(
        {
          date_taken: Faker::Date.between(4.months.ago, Date.today),
          score: 50,
          description: 'Below Average',
          }),
      Cbm.create(
        {
          date_taken: Faker::Date.between(4.months.ago, Date.today),
          score: 90,
          description: 'Average',
          }),
      Cbm.create(
        {
          date_taken: Faker::Date.between(4.months.ago, Date.today),
          score: 30,
          description: 'Well Below Average',
          }),
      Cbm.create(
        {
          date_taken: Faker::Date.between(4.months.ago, Date.today),
          score: 66,
          description: 'Average',
          }),
      Cbm.create(
        {
          date_taken: Faker::Date.between(4.months.ago, Date.today),
          score: 45,
          description: 'Below Average',
          }),
      ]
      })

  end
puts "10 students created."
end