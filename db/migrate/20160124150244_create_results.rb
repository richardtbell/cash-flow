class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :user, index: true
      t.integer :question1
      t.integer :question2
      t.integer :question3
      t.integer :question4
      t.integer :question5
      t.integer :question6
      t.integer :question7
      t.integer :question8
      t.integer :question9
      t.integer :question10

      t.timestamps null: false
    end
  end
end
