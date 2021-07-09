# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#USERS
tom = User.create(username: "tom", password: "password")
matt = User.create(username: "matt", password: "password")

#INSTRUMENTS
piano = Instrument.create(name: "piano")
guitar = Instrument.create(name: "guitar")

#ROUTINES
piano_routine = Routine.create(name: "Piano Routine", instrument_id: piano.id, user_id: tom.id)
guitar_routine = Routine.create(name: "Guitar Routine", instrument_id: guitar.id, user_id: matt.id)

#ITEMS
piano_item1 = Item.create(name: "Piano Etude: Chopin", description: "Chopin Etude to promote finger independence", goal: "Practice for 15 min", routine_id: piano_routine.id)
piano_item2 = Item.create(name: "Piano Jazz Transcription", description: "Learn jazz solo by ear", goal: "Practice for 20 min", routine_id: piano_routine.id)
guitar_item1 = Item.create(name: "Guitar Finger Exercise", description: "spider crawl for left hand", goal: "Practice for 10 min", routine_id: guitar_routine.id)
guitar_item2 = Item.create(name: "Guitar Rock Cover", description: "learn rock progression by ear", goal: "Practice for 30 min", routine_id: guitar_routine.id)

#NOTES
piano_item1_note = Note.create(content: "focus more on left hand tomorrow", item_id: piano_item1.id)
piano_item2_note = Note.create(content: "start verse 2 next time", item_id: piano_item2.id)
guitar_item1_note = Note.create(content: "need to slow this down more and build up gradually", item_id: guitar_item1.id)
guitar_item2_note = Note.create(content: "this was too easy, need to pick a more challenging song", item_id: guitar_item2.id)

#TIPS
warm_up = Tip.create(
  title: "Warm Up",
  content: "Like a physical workout, a warm-up is essential. But don’t just plough through the same warm-up routine every-time and let your mind wander – a warm-up isn't just about getting your muscles moving. Take it as an opportunity to prepare your body and mind for work and take stock of how you're feeling, how you're breathing, the tension your body is holding and why you are doing that particular exercise. Your warm-up doesn’t always have to be 15 minutes of scales; try different technical studies or sight reading. If you are going to do scales, consider the keys of the pieces you are rehearsing. And as a cool-down, revisit a piece of music you already know well and enjoy."
)

goal = Tip.create(
  title: "Have a Goal",
  content: "Playing through all your old music isn’t the same as practising. Start with the end in mind: by having a goal for each practice session before you start playing, you will find you progress much more quickly and effectively. Then, break each goal down into smaller, focused objectives. You'll feel a great sense of accomplishment as you complete each goal."
)
