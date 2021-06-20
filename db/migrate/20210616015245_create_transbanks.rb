class CreateTransbanks < ActiveRecord::Migration[5.2]
  def change
    create_table :transbanks do |t|
      t.references :transbankeable, polymorphic: true

      t.timestamps
    end
  end
end
