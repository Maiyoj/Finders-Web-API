class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles  do |t|
      t.string :twitter
      t.string :twich
      t.string :bio
      t.integer :user_id
    end
  end
end
