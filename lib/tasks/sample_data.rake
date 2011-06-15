namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
    :email => "example@dreamkit.net",
    :password => "foobar",
    :password_confirmation => "foobar",
    :phone_number => "0101234560",
    :birthday => "Thu Apr 16 00:00:00 +0100 2009")
    admin.toggle!(:admin)

    Program.create!(:title => "SVL", :price => 200000, :period => 8, :term => 4)
    Program.create!(:title => "Creative Studio", :price => 200000, :period => 4, :term => 1)
    Program.create!(:title => "Mock Social Venture Camp", :price => 100000, :period => 2, :term => 1)
    Program.create!(:title => "DEP", :price => 400000, :period => 8, :term => 8)

    Rsvp.create!(:user_id => 1, :program_id => 1, :status => "not payed")
    Rsvp.create!(:user_id => 1, :program_id => 2, :status => "payed")
    Rsvp.create!(:user_id => 1, :program_id => 3, :status => "applied")

  end
end