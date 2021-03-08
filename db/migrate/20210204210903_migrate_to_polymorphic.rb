class MigrateToPolymorphic < ActiveRecord::Migration[6.1]
  def up
    Actor.all.each do |a|
      p = Person.find(a.person_id)
      p.personable = a
      p.save!
    end
  end
end
