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

distractions = Tip.create(
  title: "Eliminate Distractions",
  content: "Resist the urge to check your texts in between exercises! If you are easily distracted by your technology, turn it off. Hide your phone in your backpack or instrument case and make a bet with yourself that you won’t look at it until you take a water break. Leave the room when you use your phone. Create phone-free vibes in your practice room so your temptations wane over time. If you are practising in a school where you are distracted often by friends walking by, or if you are nervous about who might hear you, create privacy for yourself by covering your window with a scarf or a piece of paper. If you often fall for these common distractions, you’ll be amazed at how much time you save once they are eliminated."
)

listen = Tip.create(
  title: "Listen more",
  content: "Besides listening to your practice recordings, take breaks to listen to professional recordings of the very best artists performing your instrument or your music. It’s always healthy and productive to get the “goal” sound back into your head after and during practising. Listen to music that represents the way you want to sound. The more you can reference back to these recordings, the more on-track your practice sessions will be."
)

breaks = Tip.create(
  title: "Take Breaks",
  content: "Speaking of breaks, it’s super healthy to take an occasional pause in your practice routine! Spending hours in the practice room can be taxing, both mentally and physically. Make sure to take breaks occasionally: get out of your practice room, go for a walk, get a snack, have some water, sing, or check your texts (finally, phew). Please don’t see breaks as lazy or unproductive. Taking a few minutes away from your intense focus and letting your mind and body relax is so good for your productivity."
)

sight_read = Tip.create(
  title: "Sight Read",
  content: "If you need a break from the same old exercises, take 20 minutes to sight read during your practice session. Sight reading is essential for your development as a musician, and it’s fun! Grab a friend and sight read some duets together. Sight reading with a friend can push you to be accountable, not give up, and work even harder than you might if you sight read alone. I find that when I sight read, I am focused so deeply in the reading that I stop over-analysing everything else like my breathing, my tonguing, or my posture. All of those things seem to fix themselves when I am intensely focused on just creating music. Sight reading offers a refreshing break from your practice session."
)

handy_instrument = Tip.create(
  title: "Keep Your Instrument Handy",
  content: "It is very important to leave an instrument where it can be seen and played easily, as opposed to storing it away somewhere out of sight where you could forget about it."
)

time = Tip.create(
  title: "Make it a Priority to Practice At Least 15 Minutes",
  content: "The key to improvement is consistency.  If you can set aside at least 15 minutes a day, almost every day, of focused practice, you will advance very quickly in your musical abilities.  Plus, this cuts down on the excuse of “I didn’t have time to practice     today.”  EVERYONE has 15 minutes each day that they can make a priority for practice."
)

sections = Tip.create(
  title: "Practice Songs In Sections",
  content: "It is initially easier to practice a song or piece in a sections rather than trying to get through the entire song.  If you are just beginning to learn a new piece, try playing the “A” or “verse” section first slowly with confidence before moving to the next section.  Make sure you come back review your sections as you progress through the song."
)

no_stopping = Tip.create(
  title: "Play Songs Or Sections of Songs Without Stopping",
  content: "Once you have worked out how to perform a particular piece of music or a section of a song, play through it without stopping.  Even if you make little mistakes, you want to try to complete what you are doing.  You can make notes of what part of the song gave you the most trouble and go back and work on just those sections."
)

mistakes = Tip.create(
  title: "Don’t Practice Your Mistakes",
  content: "If you play something incorrectly more than twice, you need to stop and work out your mistake.  Remember that practice makes PERMANENT (only perfect practice makes perfect) and that works with playing things Incorrectly.  Play your most challenging parts over and over until you are able to play them properly."
)
