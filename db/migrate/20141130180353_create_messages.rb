class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :author, index: true
      t.references :prev_status, index: true
      t.references :prev_owner, index: true
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
