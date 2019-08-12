class CreatePhonenumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phonenumbers do |t|
      t.integer :number

      t.timestamps
    end
  end
end
