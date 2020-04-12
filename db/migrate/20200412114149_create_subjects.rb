class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :teacher, foreign_key: true
      t.string :title
      t.integer :weekday
      t.integer :period

      t.timestamps
    end
  end
end
