class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.references :subject, foreign_key: true
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
