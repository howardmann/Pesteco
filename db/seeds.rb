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
fratelliBridge = Building.create(
  :name => 'Fratelli Fresh Bridge St',
  :address => '11 Bridge St, Sydney NSW 2000'
)

fratelliFreshMacquarie = Building.create(
  :name => 'Fratelli Fresh Macquarie St',
  :address => '229-231 Macquarie St, Sydney NSW 2000'
)

fratelliWalshBay = Building.create(
  :name => 'Fratelli Fresh Walsh Bay',
  :address => '8/16 Hickson Rd, Walsh Bay NSW 2000'
)

fratelliPottsPoint = Building.create(
  :name => 'Fratelli Fresh Potts Point',
  :address => '81 MacLeay St, Potts Point NSW 2011'
)

fratelliAlexandria = Building.create(
  :name => 'Fratelli Fresh Alexandria',
  :address => '52 Mitchell Rd, Alexandria NSW 2015'
)

fratelliCrows = Building.create(
  :name => 'Fratelli (Crows Nest)',
  :address => '118 Willoughby Rd, Crows Nest NSW 2065'
)

cafeAnanas = Building.create(
  :name => 'Café Ananas',
  :address => '2 Phillip St, Sydney NSW 2000'
)

fratelliFamous = Building.create(
  :name => 'Fratelli Famous (World Square)',
  :address => 'World Square, Latitude Tower World Square, 644 George St, Sydney NSW 2000'
)

bavarianWorld = Building.create(
  :name => 'Bavarian Bier Café (World Square)',
  :address => 'World Square, Latitude Tower World Square, 644 George St, Sydney NSW 2000'
)

sakeGrosvenor = Building.create(
  :name => 'Sake Jnr Grosvenor Place',
  :address => '225 George St, The Rocks NSW 2000'
)

bavarianManly = Building.create(
  :name => 'Bavarian Bier Café (Manly)',
  :address => 'Manly Wharf, 2-5 E Esplanade, Manly NSW 2095'
)

argyleSake = Building.create(
  :name => 'The Argyle - Sake Restaurant & Bar',
  :address => '12 Argyle St, The Rocks NSW 2000'
)

argyleCut = Building.create(
  :name => 'The Argyle - The Cut',
  :address => '12 Argyle St, The Rocks NSW 2000'
)

argyleElCamino = Building.create(
  :name => 'The Argyle - El Camino Cantino',
  :address => '12 Argyle St, The Rocks NSW 2000'
)

argyleMunich = Building.create(
  :name => 'The Argyle - Munich Brauhaus',
  :address => '12 Argyle St, The Rocks NSW 2000'
)

argyleBar = Building.create(
  :name => 'The Argyle - Argyle Bar',
  :address => '12 Argyle St, The Rocks NSW 2000'
)

hanseatic = Building.create(
  :name => 'Hanseatic Fine Foods',
  :address => '26 Ferndell St, South Granville NSW 2142'
)


# sake = Building.create(
#   :name => 'Sake The Rocks',
#   :address => '12 Argyle Street, Sydney NSW 2000'
# )
#
# bavarian = Building.create(
#   :name => 'Bavarian Bondi Beach',
#   :address => '108 Campbell Parade, Bondi Beach NSW 2026'
# )
#
# fratelli = Building.create(
#   :name => 'Fratelli Fresh Alexandria',
#   :address => '52 Mitchell Road, Alexandria NSW 2015'
# )

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
  :pdf => 'sample pesteco'
)

coogeeReport2 = Report.create(
  :date => '20160915',
  :pdf => 'sample pesteco'
)

wongReport1 = Report.create(
  :date => '20160815',
  :pdf => 'sample pesteco'
)

wongReport2 = Report.create(
  :date => '20160915',
  :pdf => 'sample pesteco'
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

urban.buildings << fratelliBridge << fratelliFreshMacquarie << fratelliWalshBay << fratelliPottsPoint << fratelliAlexandria << fratelliCrows << cafeAnanas << fratelliFamous << bavarianWorld << sakeGrosvenor << bavarianManly << argyleSake << argyleCut << argyleElCamino << argyleMunich << argyleBar << hanseatic

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

# POSTS ..........................................
Post.destroy_all
insuranceProperty = Post.create(
  :title => 'Public Liability and Professional Indemnity',
  :date => '20161010',
  :body => "Pesteco currently holds insurance policies with Pacific International Insurance for Public Liability and Professional Indemnity.",
  :category => 'Insurance',
  :attachments => ['Pesteco/publicliability']
)

insuranceWorkers = Post.create(
  :title => "Workers Compensation",
  :date => '20161009',
  :body => "Pesteco currently holds insurance policies with CGU Insurance for Workers Compensation.",
  :category => 'Insurance',
  :attachments => ['Pesteco/workersinsurance']
)

certificationQuality = Post.create(
  :title => 'ISO 9001: Quality Management System',
  :date => '20160712',
  :body => 'Pesteco have Quality Management Plan aligned with ISO 9001:2015 and are certified at the highest industry standard. A copy of our certification has been supplied below and our detailed management plan can be supplied upon request. With quality at the core of everything Pesteco do, our clients will be guaranteed exceptional service and reliability.',
  :category => 'Certification',
  :attachments => ['Pesteco/quality']
)

certificationEnvironment = Post.create(
  :title => 'ISO 14001: Environmental Management System',
  :date => '20160712',
  :body => 'Pesteco have an Environmental Management Plan aligned with ISO 14001 and are certified at the highest industry standard. A copy of our certification has been supplied below and our detailed management plan can be supplied upon request. Pesteco are the highest industry certified pest control company throughout Australia. Our clients can partner with Pesteco with peace of mind that our policies and procedures adhere with the highest industry standards in pest control services.',
  :category => 'Certification',
  :attachments => ['Pesteco/environmental']
)

certificationOHS = Post.create(
  :title => 'ISO 4801: Occupational Health and Safety',
  :date => '20160712',
  :body => 'Pesteco have an Occupational Health and Safety Plan aligned with AS/NZ 4801 and are certified at the highest industry standard. A copy of our certification has been supplied below and our detailed management plan can be supplied upon request. We are also certified in HACCP (Hazard Analysis Critical Control Point - Food Safety), ensuring we adhere to the highest regulations set out when dealing with food safety in and around kitchens, cafes and sites where perishable items are stored',
  :category => 'Certification',
  :attachments => ['Pesteco/occupational']
)

certificationFood = Post.create(
  :title => 'HACCP: Food Safety - Hazard Analysis Critical Control Point',
  :date => '20160712',
  :body => 'Pesteco is certified in HACCP (Hazard Analysis Critical Control Point - Food Safety), ensuring we adhere to the highest regulations set out when dealing with food safety in and around kitchens, cafes and sites where perishable items are stored. Pesteco has received the highest certification in Food Safety Management ensuring all technicians are trained in the safety of treatment in and around these facilities. A copy of our certification has been supplied below and our detailed management plan can be supplied upon request.',
  :category => 'Certification',
  :attachments => ['Pesteco/foodsafety']
)

# newsDog = Post.create(
#   :title => 'New staff announcement',
#   :date => '20161102',
#   :body => '<p>We are pleased to announce the latest member of the Pesteco team, Mr. Bailey. Mr Bailey comes highly regarded in the industry and is well known to Pesteco senior staff member Mr. Bruno.</p>',
#   :category => 'News',
#   :attachments => ['Pesteco/dog']
# )
#
# newsWin = Post.create(
#   :title => 'Contract win',
#   :date => '20161101',
#   :body => "<p>Pesteco is pleased to announce a major contract win with Urban Purveyor Group, the largest restaurant group in Australia. As the most highly certified pest management company in Australia, Pesteco is committed to delivering outstanding quality and service to its clients. Pesteco CEO, Bogdan Kolev stated 'This is a significant win for Pesteco and reinforces the quality and standard we constantly deliver'.</p>",
#   :category => 'News',
#   :attachments => ['Pesteco/urban']
# )

# Post test
puts "\nPOSTS......."
puts "Posts count: #{Post.all.length}"
puts "Post title: #{Post.all.pluck(:title)}"
puts "Post insurance count: #{Post.all.select{|post| post.category == 'Insurance'}.length}"
puts "Post certification count: #{Post.all.select{|post| post.category == 'Certification'}.length}"
# puts "Post news count: #{Post.all.select{|post| post.category == 'News'}.length}"
