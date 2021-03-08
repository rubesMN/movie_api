class AddPersonableToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :personable, type: :binary, limit: 16, null: true, polymorphic: true
  end
end
