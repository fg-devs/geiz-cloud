class CreateIaasAttributes < ActiveRecord::Migration
  def change
    create_table :iaas_attributes do |t|
      t.decimal :ram
      t.decimal :cpu
      t.decimal :storage
      t.decimal :bandwidth
      t.references :cloud_service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
