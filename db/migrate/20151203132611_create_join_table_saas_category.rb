class CreateJoinTableSaasCategory < ActiveRecord::Migration
  def change
    create_join_table :cloud_services, :saas_categories do |t|
      # t.index [:cloud_service_id, :saas_category_id]
      # t.index [:saas_category_id, :cloud_service_id]
    end
  end
end
