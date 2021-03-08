class DropMoviesActors < ActiveRecord::Migration[6.1]
  def change
    drop_table :movies_actors
  end
end
