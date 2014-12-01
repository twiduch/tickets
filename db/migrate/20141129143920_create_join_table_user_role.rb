class CreateJoinTableUserRole < ActiveRecord::Migration
  def change
    create_join_table :users, :roles, table_name: :user_roles do |t|
       t.index [:user_id, :role_id]
       t.index [:role_id, :user_id]
    end
  end
end
