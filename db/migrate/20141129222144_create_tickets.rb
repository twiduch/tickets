class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ref
      t.string :creator_name
      t.string :creator_email
      t.string :department
      t.string :subject
      t.text :body
      t.references :owner, index: true
      t.references :status, index: true

      t.timestamps
    end
  end
end
