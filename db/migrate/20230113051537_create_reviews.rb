class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.string :name, null: false
      t.string :addresses, null: false
      t.string :menu, null: false
      t.text :introduction, null: false
      t.text :star, null: false
      t.timestamps
    end
  end
end
