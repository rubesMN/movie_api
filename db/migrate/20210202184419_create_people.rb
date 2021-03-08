class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people, id: :binary, limit: 16 do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
  end
end
