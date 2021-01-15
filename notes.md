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
