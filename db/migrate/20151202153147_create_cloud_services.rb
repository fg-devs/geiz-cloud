class CreateCloudServices < ActiveRecord::Migration
  def change
    create_table :cloud_services do |t|
      t.string :title
      t.string :short_description
      t.text :long_description
      t.decimal :price
      t.string :provider_url
      t.boolean :active
      t.references :cloud_service_type, index: true, foreign_key: true
      t.references :user_service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
