# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MAR_STUDENTS = [
  ["Kellen", "Hart", "kellenhart@gmail.com"],
  ["Daniel", "Tsui", "dmtsui@gmail.com"],
  ["Luke", "Lolla", "lukelolla@gmail.com"],
  ["Darwish", "Gani", "dargani123@gmail.com"],
  ["Dylan", "Clark", "dylanpatrickclark@gmail.com"],
  ["Joshua", "Wilborn", "Joshua.J.Wilborn@gmail.com"],
  ["Nathan", "Hayflick", "nhayflick@gmail.com"],
  ["Benjamin", "Shope", "ben@benshope.com"],
  ["Mark", "Millman", "markmillman@gmail.com"],
  ["Roman", "Gurovich", "romangurovich@gmail.com"],
  ["Aaron", "Rama", "aaronrama@gmail.com"],
  ["James", "Yu", "supersecretjames@gmail.com"],
  ["Steven", "Chien", "sjchien@gmail.com"],
  ["Lisa", "Friedman", "lisacf@gmail.com"],
  ["David", "Smith", "d.a.smith.ii@gmail.com"],
  ["Dale", "Knauss", "daleknauss@gmail.com"],
  ["Steven", "Li", "StevenJLi@gmail.com"],
  ["Ian", "Morrison", "ian.morrison.a@gmail.com"],
  ["India", "Meisner", "india.rae@gmail.com"],
  ["Eric", "Lin", "e.lin@live.com"],
  ["David", "Xu", "dvdyxu@gmail.com"],
  ["April", "Goldman", "aprileliza@gmail.com"],
  ["Nicholas", "Hong", "hong.nick@gmail.com"],
  ["Brian", "Heithaus", "bheithaus@gmail.com"],
  ["Eric", "Xu", "exu.data@gmail.com"],
  ["Ean", "Huddleston", "ean.huddleston@gmail.com"],
  ["Matthew", "Shopsin", "mshopsin@gmail.com"],
  ["Rich", "Wallett", "Rich.Wallett@gmail.com"],
  ["Kenneth", "Greer", "greer.kenneth@gmail.com"],
  ["Peter", "Lin", "peter.lin@post.harvard.edu"],
  ["Bryant", "Detwiller", "bryant.detwiller@gmail.com"],
  ["Anthony", "Woo", "anthonywoo88@gmail.com"]
]

MAR_STUDENTS.each do |fname, lname, email|
  User.create!(
    :fname => fname,
    :lname => lname,
    :email => email,
  )
end