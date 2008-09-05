class CreateFarmers < ActiveRecord::Migration
  def self.up
    create_table :farmers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :telephone
      t.string :referring_party
      t.string :referee_contact
      t.integer :farm_id
      t.integer :survey_id

      t.timestamps
    end
  end

  def self.down
    drop_table :farmers
  end
end
