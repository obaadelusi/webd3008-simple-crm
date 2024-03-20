class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
