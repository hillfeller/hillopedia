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
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
wikis = Wiki.all



# Create a member
standard = User.create!(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld',
  role:     'standard'
)

premium = User.create!(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)

admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

hillary = User.create!(
  name:     'Hillary Feller',
  email:    'hillfeller@example.com',
  password: 'helloworld',
  role:     'admin'
)


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
