# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying All Collaboration"
Collaboration.destroy_all

puts "Destroying All project"
Project.destroy_all

puts "Destroying All User"
User.destroy_all

puts "Seeding start"
puts "Creating users"
20.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  user.save
  puts "#{user.email} create"
end

puts "Creating projects"
20.times do
  the_user = User.all.sample
  project = Project.create!(name: Faker::Sports::Chess.opening,
                          skill: ['Front-End Developer', 'Back-End Developer', 'Full Stack Developer', 'UX/UI Designer', 'Graphic Designer'].sample,
                          description: Faker::Hipster.sentence,
                          user: the_user)
  project.save
  puts "#{project.name} create"
end

10.times do
  the_user = User.all.sample
  the_project = Project.all.sample
  while the_user == the_project.user
    the_user = User.all.sample
    the_project = Project.all.sample
  end
  collab = Collaboration.create!(user: the_user, project: the_project)
  collab.save
  puts "New collab create: #{the_user.email} join #{the_project.user.email} project "
end

puts "Finished!"

# puts "creating project"
# proj = Project.create(name: "test", skill: "exem exma epr", description: "whatever", user: util)

# puts "creating colab"
# colab = Collaboration.create(user: util, project: proj)
# colab.save
