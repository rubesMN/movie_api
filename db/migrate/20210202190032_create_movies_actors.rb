class CreateMoviesActors < ActiveRecord::Migration[6.1]
  def change
    create_table :movies_actors do |t|
      t.references :movie, {
        type: :binary,
        limit: 16,
        foreign_key: { to_table: :movies },
        null: true,
      }
      t.references :actor, {
        type: :binary,
        limit: 16,
        foreign_key: { to_table: :actors },
        null: true,
      }
      t.timestamps
    end
  end
end
