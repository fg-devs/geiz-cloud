class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :cloud_services, :paas_categories do |t|
      # t.index [:cloud_service_id, :paas_category_id]
      # t.index [:paas_category_id, :cloud_service_id]
    end
  end
end
