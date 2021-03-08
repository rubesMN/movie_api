class DropBelongsToPersonFromActor < ActiveRecord::Migration[6.1]
  def change
    remove_column :actors, :person_id
  end
end
