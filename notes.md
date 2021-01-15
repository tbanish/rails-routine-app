# Sprints

## Sprint 1
- [ ] set up models with attributes and associations
- [ ] test model relationships in console

## Sprint 2
- [ ] set up sessions route and controller
- [ ] build sign up feature
- [ ] build log in feature
- [ ] build log out feature

# Routes

- User
  - show => users/1

- Routine
  - index => routines/
  - show => routines/1
  - new => routines/new
  - edit => routines/1/edit
  - destroy => routines/1/destroy

- Instrument
  - index => instruments/
  - show => instruments/1

- Item
  - index => routines/1/items
  - show => routines/1/items/1
  - new => routines/1/items/new
  - edit => routines/1/items/1/edit
  - destroy => routines/1/items/1/destroy

- Note
  - show => routines/1/items/1/notes/1
  - new => routines/1/items/1/notes/new
  - edit => routines/1/items/1/notes/1/edit
  - destroy => routines/1/items/1/notes/1/destroy


# Models & Attributes

- User
  - username
  - password

- Routine
 - name
 - instrument_id
 - user_id

- Instrument
  - name

- Item
  - name
  - duration
  - description
  - goal
  - routine_id

- Note
  - content
  - item_id

# Associations

- User
  - has_many :routines
  - has_many :instruments, through: :routines

- Routine
  - belongs_to :user
  - belongs_to :instrument

- Instrument
  - has_many :routines
  - has_many :users, through: :routines

- Item
  - has_many :notes
  - belongs_to :routine

- Note
  - belongs_to :item
