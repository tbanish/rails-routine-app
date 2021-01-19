# Sprints

## Sprint 1
- [x] set up models with attributes and associations
- [x] test model relationships in console

## Sprint 2
- [x] create seed data
- [x] set up sessions route and controller
- [x] build sign up feature
- [x] build log in feature
- [x] build log out feature

## Sprint 3
- [x] build instrument index route
- [x] build instrument show route
- [x] build routine index route
- [x] build routine show route
- [x] build routine new route
- [x] build routine edit route
- [x] build routine destroy route

## Sprint 4
- [x] build item index route
- [x] build item show route
- [x] build item new route
- [x] build item edit route
- [x] build item destroy route

## Sprint 5
- [x] build note show route
- [x] build note new route
- [ ] build note edit route
- [ ] build note destroy route

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
