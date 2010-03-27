class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
