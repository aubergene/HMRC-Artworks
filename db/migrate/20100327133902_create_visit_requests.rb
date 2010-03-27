class CreateVisitRequests < ActiveRecord::Migration
  def self.up
    create_table :visit_requests do |t|
      t.integer :artwork_id
      t.string  :from_name
      t.string  :from_email
      t.string  :from_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :visit_requests
  end
end
