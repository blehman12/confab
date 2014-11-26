namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # admin = User.create!(name: "Example User",
    #                      email: "testing@test.org",
    #                      password: "foobar",
    #                      password_confirmation: "foobar",
    #                      admin: true)
    # 99.times do |n|
    #   name  = Faker::Name.name
    #   email = "test.email#{n+1}@email.org"
    #   password  = "password"
    #   User.create!(name: name,
    #                email: email,
    #                password: password,
    #                password_confirmation: password)
    # end

    # populate events
    99.times do |n|
      name  = "Sample Event #{n+1}"
      user = 1
      location  = "Sample Location #{n+1}"
      start = 2014-11-(n+1)
      stop = 2014-11-(n+1)
      address = "#{n+200} Street St."
      address2 = "Suite 201"
      city = "Portland"
      state = "OR"
      zipcode = 97229
      recurrence = 1
      description = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat."
      theme = 1
      category = 2
      subcategoryA = "subcategory #{n+1}"
      subcategoryB = "subcategory #{100-n}"
      subcategoryC = "subcategory #{200-n}"
      tags = "tags #{n+1}"
      contact = "test.email#{n+1}@email.org"
      Event.create!(name: name,
                  user_id: user,
                  location: location,
                  start: start,
                  stop: stop,
                  address: address,
                  address2: address2,
                  city: city,
                  state: state,
                  zipcode: zipcode,
                  recurrence: recurrence,
                  description: description,
                  theme_id: theme,
                  category_id: category,
                  subcategoryA: subcategoryA,
                  subcategoryB: subcategoryB,
                  subcategoryC: subcategoryC,
                  contact: contact,
                  tags: tags)
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