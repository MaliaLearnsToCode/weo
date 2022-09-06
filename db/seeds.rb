puts "Clearing old data..."
ParticipantReview.destroy_all
Participation.destroy_all
CreatorReview.destroy_all
User.destroy_all
InterestType.destroy_all
Interest.destroy_all
Itinerary.destroy_all
Activity.destroy_all
Chatroom.destroy_all
Message.destroy_all

puts "Creating Users..."

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931658/swk8hfiuaidnxjxa7n2b.jpg")
user1 = User.new(
  email: "malia@lewagon.com",
  password: "12345678",
  first_name: "Malia",
  last_name: "Nyugen",
  age: 18,
  gender: "female",
  nickname: "malia123"
)
user1.photos.attach(io: file, filename: "malia.jpg", content_type: "image/jpg")
user1.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931664/zu9du1kwa8s7kv1dekm5.jpg")
user2 = User.new(email: "felita@lewagon.com", password: "12345678", first_name: "Felita", last_name: "Liem", age: 26, gender: "female", nickname: "Felita123")
user2.photos.attach(io: file, filename: "felita.jpg", content_type: "image/jpg")
user2.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931684/ekh2cozeztcrvita4tsf.jpg")
user3 = User.new(email: "denish@lewagon.com", password: "12345678", first_name: "Denish", last_name: "Hisham", age: 28, gender: "male", nickname: "denish123")
user3.photos.attach(io: file, filename: "denish.jpg", content_type: "image/jpg")
user3.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931672/j2wqz6pvb5rqhrhlkjr7.png")
user4 = User.new(email: "julien@lewagon.com", password: "12345678", first_name: "Julien", last_name: "Wong", age: 30, gender: "male", nickname: "julien123")
user4.photos.attach(io: file, filename: "julien.jpg", content_type: "image/jpg")
user4.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931639/ifdtfx8yvpuu5u83klxo.jpg")
user5 = User.new(email: "ashley@lewagon.com", password: "12345678", first_name: "Ashley", last_name: "Yeo", age: 21, gender: "male", nickname: "ashley123")
user5.photos.attach(io: file, filename: "ashley.jpg", content_type: "image/jpg")
user5.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931631/kyaiwuvcaax88srp4rt2.png")
user6 = User.new(email: "suansen@lewagon.com", password: "12345678", first_name: "Suansen", last_name: "Yeo", age: 21, gender: "male", nickname: "suansen123")
user6.photos.attach(io: file, filename: "suansen.jpg", content_type: "image/jpg")
user6.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931651/xxkkwpq31dntzsxlisht.jpg")
user7 = User.new(email: "yc@lewagon.com", password: "12345678", first_name: "Y", last_name: "C", age: 21, gender: "male", nickname: "yc123")
user7.photos.attach(io: file, filename: "yc.jpg", content_type: "image/jpg")
user7.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931645/b0r1yn7gqbqguzxrr2n3.jpg")
user8 = User.new(email: "eason@lewagon.com", password: "12345678", first_name: "Eason", last_name: "Lewagon", age: 18, gender: "male", nickname: "eason123")
user8.photos.attach(io: file, filename: "eason.jpg", content_type: "image/jpg")
user8.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931623/ovq90l0f7m1mkvdqchma.jpg")
user9 = User.new(email: "onemore@lewagon.com", password: "12345678", first_name: "John", last_name: "Doe", age: 31, gender: "male", nickname: "john123")
user9.photos.attach(io: file, filename: "john.jpg", content_type: "image/jpg")
user9.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1661931287/mswobhnjshv4pn5voq4g.jpg")
user10 = User.new(email: "notsure@lewagon.com", password: "12345678", first_name: "Jane", last_name: "Doey", age: 25, gender: "female", nickname: "jane123")
user10.photos.attach(io: file, filename: "jane.jpg", content_type: "image/jpg")
user10.save!







puts "Creating interest types..."
interest_type1 = InterestType.create!(
  name: "city",
  description: "anything to do with a ground and somewhat chill, no water no dirty stuff")

interest_type2 = InterestType.create!(name: "outdoor", description: "get ready to get down and dirty, mud, sun, whatever you want.")
interest_type3 = InterestType.create!(name: "water", description: "be ready to get wet, could be outdoor, could be indoor, who knows?")









puts "Creating Interests..."
interest1 = Interest.create!(
  interest_type: interest_type1,
  user: user1)

interest2 = Interest.create!(interest_type: interest_type2, user: user2)
interest3 = Interest.create!(interest_type: interest_type3, user: user3)










puts "Creating Itineraries..."
file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348937/zpdjfch0l7y1sgka9n1m.jpg")
itinerary0 = Itinerary.new(
  user: user1,
  start_date: Date.new(2022, 7, 10),
  end_date: Date.new(2022, 7, 10),
  country: "Germany",
  city: "Frankfurt",
  description: "Malia's prehistoric itinerary. Already happened but just including it for data hahaahhaah",
  title: "Stopby but make it fun!")
itinerary0.photos.attach(io: file, filename: "frankfurt.jpg", content_type: "image/jpg")
itinerary0.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348949/xzgrswrscatml69gi81t.jpg")
itinerary1 = Itinerary.new(
  user: user1,
  start_date: Date.new(2022, 7, 20),
  end_date: Date.new(2022, 7, 25),
  country: "Germany",
  city: "Berlin",
  description: "This is Malia's perfect itinerary!",
  title: "Germany, here we come!")
itinerary1.photos.attach(io: file, filename: "berlin.jpg", content_type: "image/jpg")
itinerary1.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348957/ditsnoddzhq6xxng11z1.jpg")
itinerary2 = Itinerary.new(
  user: user1,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 28),
  country: "Indonesia",
  city: "Jakarta",
  description: "Still Malia's idk itinerary!",
  title: "LETS GO JKTTTTT!")
itinerary2.photos.attach(io: file, filename: "jakarta.jpg", content_type: "image/jpg")
itinerary2.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348975/jhpm6lmqtvk5f7qucz0d.jpg")
itinerary3 = Itinerary.new(
  user: user1,
  start_date: Date.new(2022, 9, 20),
  end_date: Date.new(2022, 10, 1),
  country: "Hawaii",
  city: "Maui",
  description: "Also still Malia's perfect itinerary!",
  title: "Maui, excited for you!")
itinerary3.photos.attach(io: file, filename: "maui.jpg", content_type: "image/jpg")
itinerary3.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348984/lvmknogjld0sjppkfal7.jpg")
itinerary4 = Itinerary.new(
  user: user3,
  start_date: Date.new(2022, 9, 20),
  end_date: Date.new(2022, 10, 1),
  country: "Thailand",
  city: "Chiang Mai",
  description: "Dan's super cool itinerary! Filled with tons of adventures and stuff",
  title: "Thailand, I love you!")
itinerary4.photos.attach(io: file, filename: "chiangmai.jpg", content_type: "image/jpg")
itinerary4.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662348993/utdtz3zuezpxow0y2gzn.jpg")
itinerary5 = Itinerary.new(
  user: user2,
  start_date: Date.new(2022, 10, 1),
  end_date: Date.new(2022, 10, 8),
  country: "Japan",
  city: "Kyoto",
  description: "Felita's chill tripppppppppppp! Tea, onsen, and long walks",
  title: "Japan 2022!")
itinerary5.photos.attach(io: file, filename: "kyoto.jpg", content_type: "image/jpg")
itinerary5.save!








puts "Creating Activities..."
file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349155/kwwgoiopyvqvnnefpv3y.jpg")
activity0 = Activity.new(
  itinerary: itinerary0,
  start_time: Time.new(2022, 7, 10, 14, 30, 0, "+08:00"),
  end_time: Time.new(2022, 7, 10, 18, 30, 0, "+08:00"),
  name: "Frankfurt PubCrawl",
  detail: "I'm ready for ma coffeeeeee jk, beers of course",
  location: "Frankfurt am Main",
  max_participants: 12,
  completed: true,
  start_date: Date.new(2022, 7, 10),
  end_date: Date.new(2022, 7, 10),
  interest_type: interest_type1)
activity0.photos.attach(io: file, filename: "pubcrawl.jpg", content_type: "image/jpg")
activity0.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349036/njzhehgyfpyaf6xmnqey.jpg")
activity1 = Activity.new(
  itinerary: itinerary1,
  start_time: Time.new(2022, 7, 21, 14, 30, 0, "+08:00"),
  end_time: Time.new(2022, 7, 21, 18, 30, 0, "+08:00"),
  name: "Berlin Wall visit",
  detail: "We're visiting the Berlin Wall with UMBRELLASSS!",
  location: "Kurfürstendamm",
  max_participants: 7,
  completed: true,
  start_date: Date.new(2022, 7, 21),
  end_date: Date.new(2022, 7, 21),
  interest_type: interest_type1)
activity1.photos.attach(io: file, filename: "wall.jpg", content_type: "image/jpg")
activity1.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349045/wjhkcyvyjg4wrwm3pxrn.jpg")
activity2 = Activity.new(
  itinerary: itinerary1,
  start_time: Time.new(2022, 7, 21, 19, 30, 0, "+08:00"),
  end_time: Time.new(2022, 7, 21, 21, 30, 0, "+08:00"),
  name: "Beer Lova",
  detail: "Touring around Berlin for the best of beers",
  location: "Alexander Platz",
  max_participants: 4,
  completed: false,
  start_date: Date.new(2022, 7, 21),
  end_date: Date.new(2022, 7, 21),
  interest_type: interest_type1)
activity2.photos.attach(io: file, filename: "beer.jpg", content_type: "image/jpg")
activity2.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349055/bnllwdwhvcyn3xppxcr4.jpg")
activity3 = Activity.new(
  itinerary: itinerary1,
  start_time: Time.new(2022, 7, 25, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 7, 25, 18, 30, 0, "+08:00"),
  name: "Water Visit",
  detail: "FOSHO getting wet!!",
  location: "Berlin, Brandenburger Tor, Germany",
  max_participants: 10,
  completed: true,
  start_date: Date.new(2022, 7, 25),
  end_date: Date.new(2022, 7, 25),
  interest_type: interest_type3)
activity3.photos.attach(io: file, filename: "water.jpg", content_type: "image/jpg")
activity3.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349062/h2zff9eqduwjcykdqnwy.jpg")
activity4 = Activity.new(
  itinerary: itinerary2,
  start_time: Time.new(2022, 8, 31, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 8, 31, 18, 30, 0, "+08:00"),
  name: "Bar hop",
  detail: "LETS DRIIIIIIIIIIIIIIIIIIIIIINK!",
  location: "Jakarta, Indonesia",
  max_participants: 2,
  completed: true,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 8, 31),
  interest_type: interest_type1)
activity4.photos.attach(io: file, filename: "barhop.jpg", content_type: "image/jpg")
activity4.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349069/crgzsuej5xxpptfbqbkz.jpg")
activity5 = Activity.new(
  itinerary: itinerary2,
  start_time: Time.new(2022, 9, 28, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 9, 28, 18, 30, 0, "+08:00"),
  name: "Mountain Hike",
  detail: "Its gon be a hike!",
  location: "Merapi",
  max_participants: 8,
  completed: false,
  start_date: Date.new(2022, 9, 28),
  end_date: Date.new(2022, 9, 28),
  interest_type: interest_type2)
activity5.photos.attach(io: file, filename: "hike.jpg", content_type: "image/jpg")
activity5.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349077/x2mbhm9dj3ckiuklfiph.jpg")
activity6 =Activity.new(
  itinerary: itinerary3,
  start_time: Time.new(2022, 9, 20, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 9, 20, 18, 30, 0, "+08:00"),
  name: "First Ocean",
  detail: "Surfing!!!!!!!!!!!!!!!!!!!!! ",
  location: "799 Poho Place, Paia, HI 96779",
  max_participants: 3,
  completed: false,
  start_date: Date.new(2022, 9, 20),
  end_date: Date.new(2022, 9, 20),
  interest_type: interest_type3)
activity6.photos.attach(io: file, filename: "ocean.jpg", content_type: "image/jpg")
activity6.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349083/i7w9lbqekyusbk3gpail.jpg")
activity7 = Activity.new(
  itinerary: itinerary3,
  start_time: Time.new(2022, 9, 22, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 9, 22, 18, 30, 0, "+08:00"),
  name: "Second Seas",
  detail: "Wakeboardiiiiiiiiiiiiiiiiiing!!!!",
  location: "Sea Waters, 123 Sea Waters St. Maui, Hawaii",
  max_participants: 5,
  completed: false,
  start_date: Date.new(2022, 9, 22),
  end_date: Date.new(2022, 9, 22),
  interest_type: interest_type3)
activity7.photos.attach(io: file, filename: "sea.jpg", content_type: "image/jpg")
activity7.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349090/feq2eqkgwmnom1zydrvm.jpg")
activity8 = Activity.new(
  itinerary: itinerary3,
  start_time: Time.new(2022, 8, 15, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 8, 15, 18, 30, 0, "+08:00"),
  name: "Third Lake",
  detail: "CANOEINGGGGGGGGGGGGGGGGGG!!!",
  location: "4351 Kahala Avenue",
  max_participants: 10,
  completed: false,
  start_date: Date.new(2022, 10, 1),
  end_date: Date.new(2022, 10, 1),
  interest_type: interest_type3)
activity8.photos.attach(io: file, filename: "lake.jpg", content_type: "image/jpg")
activity8.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349097/cgu8s8eb1q9rpaktbze7.jpg")
activity9 = Activity.new(
  itinerary: itinerary5,
  start_time: Time.new(2022, 10, 1, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 10, 1, 18, 30, 0, "+08:00"),
  name: "Teaaaa",
  detail: "tea time and onsen!!!",
  location: "Inari, Kyoto, Japan",
  max_participants: 10,
  completed: false,
  start_date: Date.new(2022, 10, 1),
  end_date: Date.new(2022, 10, 1),
  interest_type: interest_type1)
activity9.photos.attach(io: file, filename: "tea.jpg", content_type: "image/jpg")
activity9.save!

file = URI.open("https://res.cloudinary.com/dyiaygjfa/image/upload/v1662349105/ycx4i8ngvy4vuvpesbp8.jpg")
activity10 = Activity.new(
  itinerary: itinerary5,
  start_time: Time.new(2022, 10, 7, 10, 30, 0, "+08:00"),
  end_time: Time.new(2022, 10, 7, 18, 30, 0, "+08:00"),
  name: "Walkies",
  detail: "walking along the best streets of kyoto!!!",
  location: "Sushi Gion Matsudaya
  570-123 Gionmachi Minamigawa, Higashiyama Ward, Kyoto, 605-0074, Japan",
  max_participants: 10,
  completed: false,
  start_date: Date.new(2022, 10, 7),
  end_date: Date.new(2022, 10, 7),
  interest_type: interest_type1)
activity10.photos.attach(io: file, filename: "walkies.jpg", content_type: "image/jpg")
activity10.save!







puts "Creating Participations..."
  ## change to partocipations
participation1 = Participation.create!(
  user: user2,
  activity: activity1,
  status: "confirmed")
participation2 = Participation.create!(status: "confirmed", user: user3, activity: activity1)
participation3 = Participation.create!(status: "confirmed", user: user4, activity: activity1)
participation4 = Participation.create!(status: "confirmed", user: user5, activity: activity1)
participation5 = Participation.create!(status: "confirmed", user: user6, activity: activity1)
participation6 = Participation.create!(status: "confirmed", user: user7, activity: activity1)

participation3 = Participation.create!(status: "confirmed", user: user4, activity: activity2)
participation4 = Participation.create!(status: "confirmed", user: user5, activity: activity2)
participation5 = Participation.create!(status: "confirmed", user: user6, activity: activity2)

participation7 = Participation.create!(status: "confirmed", user: user2, activity: activity3)
participation8 = Participation.create!(status: "confirmed", user: user3, activity: activity3)


participation9 = Participation.create!(status: "confirmed", user: user1, activity: activity4)
participation10 = Participation.create!(status: "confirmed", user: user3, activity: activity4)
participation11 = Participation.create!(status: "confirmed", user: user4, activity: activity4)

participation12 = Participation.create!(status: "confirmed", user: user8, activity: activity5)


participation13 = Participation.create!(status: "confirmed", user: user3, activity: activity6)
participation14 = Participation.create!(status: "confirmed", user: user4, activity: activity6)

participation15 = Participation.create!(status: "pending", user: user1, activity: activity7)
participation16 = Participation.create!(status: "pending", user: user3, activity: activity7)
participation17 = Participation.create!(status: "pending", user: user6, activity: activity7)
participation18 = Participation.create!(status: "pending", user: user7, activity: activity7)
participation19 = Participation.create!(status: "pending", user: user9, activity: activity7)
participation20 = Participation.create!(status: "pending", user: user10, activity: activity7)

participation21 = Participation.create!(status: "pending", user: user3, activity: activity9)







puts "Creating Chatrooms..."
chatroom1 = Chatroom.create!(
  activity: activity1,
  name: "Berlin Wall visit")

chatroom2 = Chatroom.create!(activity: activity2, name: "Beer Lova")
chatroom3 = Chatroom.create!(activity: activity3, name: "Water Visit")

chatroom4 = Chatroom.create!(activity: activity4, name: "Bar Hop")
chatroom5 = Chatroom.create!(activity: activity5, name: "Mountain Hike")

chatroom6 = Chatroom.create!(activity: activity6, name: "First Ocean")
chatroom7 = Chatroom.create!(activity: activity7, name: "Second Seas")
chatroom8 = Chatroom.create!(activity: activity8, name: "Third Lake")

chatroom9 = Chatroom.create!(activity: activity4, name: "Teaaaa")
chatroom10 = Chatroom.create!(activity: activity5, name: "Walkies")








puts "Creating Messages..."
message1 = Message.create!(
  chatroom: chatroom1,
  user: user1,
  content: "ok guys, ready?")

message2 = Message.create!(chatroom: chatroom1, user: user2, content: "yeah")
message3 = Message.create!(chatroom: chatroom1, user: user3, content: "yes")
message4 = Message.create!(chatroom: chatroom1, user: user2, content: "yessir")
message5 = Message.create!(chatroom: chatroom1, user: user1, content: "yes")

message6 = Message.create!(chatroom: chatroom5, user: user2, content: "hi, anyone see my hat?")
message7 = Message.create!(chatroom: chatroom5, user: user1, content: "me")
message8 = Message.create!(chatroom: chatroom5, user: user3, content: "cool, can u whatsapp me at +6281313131 thanks.")

message9 = Message.create!(chatroom: chatroom6, user: user1, content: "hola exciteeeed")
message10 = Message.create!(chatroom: chatroom6, user: user3, content: "super")

message11 = Message.create!(chatroom: chatroom7, user: user3, content: "should we just cancel this?")
message12 = Message.create!(chatroom: chatroom7, user: user3, content: "yeah, why not.")

message13 = Message.create!(chatroom: chatroom8, user: user3, content: "hi!")
message14 = Message.create!(chatroom: chatroom8, user: user3, content: "um hello?!")
message15 = Message.create!(chatroom: chatroom8, user: user3, content: "you guys suck!")






puts "Creating Creator Reviews....."
creatorreview1 = CreatorReview.create!(
  creator: user1,
  participant: participation1.user,
  comment: "Fel was kinda niiiiice!",
  rating: 5)

creatorreview2 = CreatorReview.create!(creator: user1, participant: participation2.user, comment: "I wish it was planned without the rain tbh, not bad tho.", rating: 3)

creatorreview3 = CreatorReview.create!(creator: user1, participant: participation1.user, comment: "Fel is ma hypewomaaaan!", rating: 5)

creatorreview4 = CreatorReview.create!(creator: user1, participant: participation2.user, comment: "Dammmmn soon! Malia killin' it!", rating: 5)





puts "Creating Participant Reviews....."
participantreview1 = ParticipantReview.create!(comment: "Malia iz da best", rating: 4, participation: participation3)

participantreview2 = ParticipantReview.create!(comment: "", rating: 5, participation: participation1)
participantreview3 = ParticipantReview.create!(comment: "Dan ain't lit enough. Nice guy tho.", rating: 4, participation: participation2)



puts "OMG WE'RE DONE!"
