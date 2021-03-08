class AddTradeMarkToActor < ActiveRecord::Migration[6.1]
  def change
    add_column(:actors, :trade_mark, :string, null: true)
  end
end
