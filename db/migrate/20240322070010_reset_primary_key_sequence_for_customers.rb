class ResetPrimaryKeySequenceForCustomers < ActiveRecord::Migration[7.1]
  def change
    ActiveRecord::Base.connection.execute("DROP TABLE customers")

    create_table :customers do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
