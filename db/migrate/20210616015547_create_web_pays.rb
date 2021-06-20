class CreateWebPays < ActiveRecord::Migration[5.2]
  def change
    create_table :web_pays do |t|

      t.timestamps
    end
  end
end
