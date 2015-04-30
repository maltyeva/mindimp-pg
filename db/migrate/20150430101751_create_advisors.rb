class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :users_advisors do |t|
      t.integer :advisor_id
      t.integer :advisee_id

      t.timestamps
    end
    add_index :users_advisors, :advisor_id
    add_index :users_advisors, :advisee_id
    add_index :users_advisors, [:advisor_id, :advisee_id], unique: true
  end
end
