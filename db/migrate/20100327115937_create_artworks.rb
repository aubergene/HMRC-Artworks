class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.integer  :hmrc_id
      t.integer  :contact_id
      t.string   :name
      t.string   :category
      t.string   :country
      t.text     :description
      t.text     :access_details

      t.timestamps
    end
  end

  def self.down
    drop_table :artworks
  end
end
