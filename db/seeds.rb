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
