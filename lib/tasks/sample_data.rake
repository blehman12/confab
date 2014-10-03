namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "testing@test.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "test.email#{n+1}@email.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    # def make_relationships
    #   users = User.all
    #   user  = users.first
    #   followed_users = users[2..50]
    #   followers      = users[3..40]
    #   followed_users.each { |followed| user.follow!(followed) }
    #   followers.each      { |follower| follower.follow!(user) }
    # end

    # users = User.all
    # # 5.times do
    # #   excomm = Faker::Lorem.words(5)
    # #   userinfo = Faker::Lorem.words(2)
    # #   users.each { |user| user.communications.create!(excomm: excomm, userinfo: userinfo) }
    # # end
    # 5.times do
    #   want = Faker::Lorem.words(1)
    #   priority = Faker::Number.digit
    #   tag = Faker::Lorem.words(1)
    #   category = Faker::Lorem.words(1)
    #   users.each { |user| user.wants.create!(wanted: want, priority: priority, tag: tag, category: category) }
    # end
    # 5.times do
    #   skill = Faker::Lorem.words(1)
    #   level = Faker::Number.digit
    #   tag = Faker::Lorem.words(1)
    #   category = Faker::Lorem.words(1)
    #   users.each { |user| user.skills.create!(skill: skill, level: level, tag: tag, category: category) }
    # end
  end
end