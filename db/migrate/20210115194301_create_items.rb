class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :goal
      t.belongs_to :routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
