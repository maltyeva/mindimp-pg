class CreateAdvisorRelationships < ActiveRecord::Migration
  def change
    create_table :advisor_relationships do |t|
      t.integer :advisor_id
      t.integer :advisee_id

      t.timestamps
    end
    add_index :advisor_relationships, :advisor_id
    add_index :advisor_relationships, :advisee_id
    add_index :advisor_relationships, [:advisor_id, :advisee_id], unique: true
  end
end
