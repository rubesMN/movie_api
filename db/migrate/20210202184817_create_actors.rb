class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors, id: :binary, limit: 16 do |t|
      t.binary :person_id, type: :binary, limit: 16, null: false, index: true
      t.binary :favorite_movie_id, type: :binary, limit: 16, null: true, index: true
      t.timestamps
    end
  end
end
