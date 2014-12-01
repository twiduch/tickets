class CreateJoinTableStatusTicket < ActiveRecord::Migration
  def change
    create_join_table :statuses, :tickets do |t|
       t.index [:status_id, :ticket_id]
       t.index [:ticket_id, :status_id]
    end
  end
end
