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

puts "Creating USers..."
user1 = User.create!(
  email: "malia@lewagon.com",
  password: "12345678",
  first_name: "Malia",
  last_name: "Nyugen",
  age: 18,
  gender: "female")

user2 = User.create!(email: "felita@lewagon.com", password: "12345678", first_name: "Felita", last_name: "Liem", age: 26, gender: "female")
user3 = User.create!(email: "denish@lewagon.com", password: "12345678", first_name: "Denish", last_name: "Hisham", age: 28, gender: "male")
user4 = User.create!(email: "julien@lewagon.com", password: "12345678", first_name: "Julien", last_name: "Wong", age: 30, gender: "male")
user5 = User.create!(email: "ashley@lewagon.com", password: "12345678", first_name: "Ashley", last_name: "Yeo", age: 21, gender: "male")
user6 = User.create!(email: "suansen@lewagon.com", password: "12345678", first_name: "Suansen", last_name: "Yeo", age: 21, gender: "male")
user7 = User.create!(email: "yc@lewagon.com", password: "12345678", first_name: "Y", last_name: "C", age: 21, gender: "male")
user8 = User.create!(email: "eason@lewagon.com", password: "12345678", first_name: "Eason", last_name: "Lewagon", age: 18, gender: "male")
user9 = User.create!(email: "onemore@lewagon.com", password: "12345678", first_name: "John", last_name: "Doe", age: 31, gender: "male")
user10 = User.create!(email: "notsure@lewagon.com", password: "12345678", first_name: "Jane", last_name: "Doey", age: 25, gender: "female")








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
itinerary0 = Itinerary.create!(
  user: user1,
  start_date: Date.new(2022, 7, 10),
  end_date: Date.new(2022, 7, 10),
  country: "Germany",
  city: "Frankfurt",
  description: "Malia's prehistoric itinerary. Already happened but just including it for data hahaahhaah",
  title: "Stopby but make it fun!")

itinerary1 = Itinerary.create!(
  user: user1,
  start_date: Date.new(2022, 7, 20),
  end_date: Date.new(2022, 7, 25),
  country: "Germany",
  city: "Berlin",
  description: "This is Malia's perfect itinerary!",
  title: "Germany, here we come!")

itinerary2 = Itinerary.create!(
  user: user1,
  start_date: Date.new(2022, 8, 31),
  end_date: Date.new(2022, 9, 28),
  country: "Indonesia",
  city: "Jakarta",
  description: "Still Malia's idk itinerary!",
  title: "LETS GO JKTTTTT!")

itinerary3 = Itinerary.create!(
  user: user1,
  start_date: Date.new(2022, 9, 20),
  end_date: Date.new(2022, 10, 1),
  country: "Hawaii",
  city: "Maui",
  description: "Also still Malia's perfect itinerary!",
  title: "Maui, excited for you!")

itinerary4 = Itinerary.create!(
  user: user3,
  start_date: Date.new(2022, 9, 20),
  end_date: Date.new(2022, 10, 1),
  country: "Thailand",
  city: "Chiang Mai",
  description: "Dan's super cool itinerary! Filled with tons of adventures and stuff",
  title: "Thailand, I love you!")

itinerary5 = Itinerary.create!(
  user: user2,
  start_date: Date.new(2022, 10, 1),
  end_date: Date.new(2022, 10, 8),
  country: "Japan",
  city: "Kyoto",
  description: "Felita's chill tripppppppppppp! Tea, onsen, and long walks",
  title: "Japan 2022!")








puts "Creating Activities..."
activity0 = Activity.create!(
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

activity1 = Activity.create!(
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

activity3 = Activity.create!(
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


activity4 = Activity.create!(
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

activity5 = Activity.create!(
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


activity6 =Activity.create!(
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

activity7 = Activity.create!(
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

activity8 = Activity.create!(
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


activity9 = Activity.create!(
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

activity10 = Activity.create!(
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

participation15 = Participation.create!(status: "confirmed", user: user1, activity: activity7)
participation16 = Participation.create!(status: "confirmed", user: user3, activity: activity7)
participation17 = Participation.create!(status: "confirmed", user: user6, activity: activity7)
participation18 = Participation.create!(status: "confirmed", user: user7, activity: activity7)
participation19 = Participation.create!(status: "confirmed", user: user9, activity: activity7)
participation20 = Participation.create!(status: "pending", user: user10, activity: activity7)

participation21 = Participation.create!(status: "pending", user: user3, activity: activity9)






puts "Creating Chatrooms..."
chatroom1 = Chatroom.create!(
  activity: activity1,
  name: "Berlin Wall")

chatroom2 = Chatroom.create!(activity: activity2, name: "Beer Love")
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
