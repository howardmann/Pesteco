# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# USER ..........................................
User.destroy_all
admin = User.create(
  :email => 'admin@email.com',
  :password => 'chicken',
  :password_confirmation => 'chicken',
  :name => 'admin',
  :mobile => '0412038990',
  :admin => true
)

michael = User.create(
  :email => 'michael@email.com',
  :password => 'chicken',
  :password_confirmation => 'chicken',
  :name => 'Michael Smith',
  :mobile => '0400000000'
)

vader = User.create(
  :email => 'vader@email.com',
  :password => 'chicken',
  :password_confirmation => 'chicken',
  :name => 'Darth Vader',
  :mobile => '0411111111'
)

sam = User.create(
  :email => 'sam@email.com',
  :password => 'chicken',
  :password_confirmation => 'chicken',
  :name =>'Sam Harris',
  :mobile =>'0422222222'
)

# User tests
p "USERS........"
p "User count: #{User.all.length}"
p "User emails: #{User.all.pluck(:email)}"

# CLIENT ..........................................
Client.destroy_all
merivale = Client.create(
  :name => 'Merivale',
  :address => 'Level 2, 320-330 George Street, Sydney NSW 2000'
)

urban = Client.create(
  :name => 'Urban Purveyor Group',
  :address => 'Level 2, 33 Playfair Street, Sydney NSW 2000'
)

harris = Client.create(
  :name => 'Harris Farm',
  :address => 'Potts Street, Homebush NSW 2140'
)

# Client tests
puts "\nCLIENTS........"
p "Client count: #{Client.all.length}"
p "Client emails: #{Client.all.pluck(:name)}"

# BUILDING ..........................................
Building.destroy_all
# Merivale buildings
coogee = Building.create(
  :name => 'Coogee Pavilion',
  :address => '169 Dolphin Street, Coogee NSW 2034'
)

wong = Building.create(
  :name => 'Mr. Wong',
  :address => '3 Bridge Lane, Sydney NSW 2000'
)

newport = Building.create(
  :name => 'The Newport',
  :address => '2 Kalinya Street, Newport NSW 2106'
)

# Urban Purveyor buildings
sake = Building.create(
  :name => 'Sake The Rocks',
  :address => '12 Argyle Street, Sydney NSW 2000'
)

bavarian = Building.create(
  :name => 'Bavarian Bondi Beach',
  :address => '108 Campbell Parade, Bondi Beach NSW 2026'
)

fratelli = Building.create(
  :name => 'Fratelli Fresh Alexandria',
  :address => '52 Mitchell Road, Alexandria NSW 2015'
)

# Harris Farm buildings
harrisBondi = Building.create(
  :name => 'Harris Farm Bondi Beach',
  :address => '61-79 Hall Street, Bondi Beach NSW 2026'
)

harrisDrummoyne = Building.create(
  :name => 'Harris Farm Drummoyne',
  :address => '121-125 Victoria Road, Drummoyne NSW 2047'
)

harrisNorton = Building.create(
  :name => 'Norton St Grocer',
  :address => '51-57 Norton Street, Leichhardt NSW 2040'
)

# Building tests
puts "\nBUILDINGS........"
p "Building count: #{Building.all.length}"
p "Building names: #{Building.all.pluck(:name)}"

# REPORTS ..........................................
Report.destroy_all
coogeeReport1 = Report.create(
  :date => '20161031',
  :pdf => 'Pesteco/Building/Date'
)

coogeeReport2 = Report.create(
  :date => '20160915',
  :pdf => 'Pesteco/Building/Date'
)

wongReport1 = Report.create(
  :date => '20160815',
  :pdf => 'Pesteco/Building/Date'
)

wongReport2 = Report.create(
  :date => '20160915',
  :pdf => 'Pesteco/Building/Date'
)

coogee.reports << coogeeReport1 << coogeeReport2
wong.reports << wongReport1 << wongReport2

# Reports tests
puts "\nREPORTS........"
p "Reports count: #{Report.all.length}"
p "Coogee building reports: #{coogee.reports.pluck(:date)}"
p "Wong building reports: #{wong.reports.pluck(:date)}"


# ASSOCIATIONS
merivale.buildings << coogee << wong << newport
urban.buildings << sake << bavarian << fratelli
harris.buildings << harrisBondi << harrisDrummoyne << harrisNorton

merivale.users << michael
urban.users << vader
harris.users << sam

# Association tests
puts "\nASSOCIATIONS....."
puts "Merivale buildings: #{merivale.buildings.all.pluck(:name)}"
puts "Merivale users: #{merivale.users.all.pluck(:name)}"

puts "\nUrban buildings: #{urban.buildings.all.pluck(:name)}"
puts "Urban users: #{urban.users.all.pluck(:name)}"

puts "\nHarris buildings: #{harris.buildings.all.pluck(:name)}"
puts "Harris users: #{harris.users.all.pluck(:name)}"

puts "\nMichael's buildings: #{michael.buildings.all.pluck(:name)}"
puts "Vader's buildings: #{vader.buildings.all.pluck(:name)}"
puts "Sam's buildings: #{sam.buildings.all.pluck(:name)}"
