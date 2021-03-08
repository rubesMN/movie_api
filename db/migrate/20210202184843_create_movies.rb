class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies, id: :binary, limit: 16 do |t|
      t.string :name
      t.integer :year
      t.string :imdb_url
      t.references :creator, {
        type: :binary,
        limit: 16,
        index: true,
        foreign_key: { to_table: :people },
        null: false,
      }
      t.timestamps
    end
  end
end
