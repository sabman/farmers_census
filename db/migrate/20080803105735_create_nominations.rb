class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations do |t|
      t.string :first_name
      t.string :last_name
      t.string :farm_name
      t.string :email
      t.string :known_as
      t.string :title
      t.text :address
      t.string :telephone_no
      t.date :date_of_birth
      t.text :nominees_profile
      t.text :nominees_contributions
      t.string :your_name
      t.string :your_email
      t.string :your_contact_details

      t.timestamps
    end
  end

  def self.down
    drop_table :nominations
  end
end
