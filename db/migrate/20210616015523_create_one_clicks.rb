class CreateOneClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :one_clicks do |t|

      t.timestamps
    end
  end
end
