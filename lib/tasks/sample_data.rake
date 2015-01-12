namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    Account.create!(name: "Silvertrek Construction")

    test_account = Account.first

    Crew.create!(name: "Black Smoke")

    #normal employee
    User.create!(name: "Worker Bee",
                 email: "example@silvertreksystems.com",
                 password: "123456",
                 password_confirmation: "123456",
                 crew: Crew.first,
                 account_id: test_account.id)

    #admin user within an account
    User.create!(name: "Boss Man",
                 email: "boss@silvertreksystems.com",
                 password: "123456",
                 password_confirmation: "123456",
                 admin: true,
                 crew: Crew.first,
                 account_id: test_account.id,
                 super_user: false)

    #super admin user for entire site
    User.create!(name: "Super Man",
                 email: "admin@silvertreksystems.com",
                 password: "123456",
                 password_confirmation: "123456",
                 admin: true,
                 crew: Crew.first,
                 account_id: test_account.id,
                 super_user: true)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@silvertreksystems.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   crew: Crew.first,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do |t|
      date = 1.day.ago-(t-1).days
      hours = (2..14).to_a.sample
      users.each { |user| user.timecards.create!(hours: hours, date: date) }
    end
  end
end
