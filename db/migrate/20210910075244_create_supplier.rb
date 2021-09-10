class CreateSupplier < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.text :name
    end
  end
end
