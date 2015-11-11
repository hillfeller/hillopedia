include RandomData

10.times do
  user = User.create!(

    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )

end

users = User.all

50.times do
  Wiki.create!(
    user: users.sample,
    title:  RandomData.random_paragraph

  )
end
wikis = Wiki.all



puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
