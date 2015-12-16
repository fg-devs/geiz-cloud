class CreateCsAttributeWeightings < ActiveRecord::Migration
  def change
    create_table :cs_attribute_weightings do |t|
      t.float :price, :precision => 10, :scale => 2
      t.float :ram, :precision => 10, :scale => 2
      t.float :cpu, :precision => 10, :scale => 2
      t.float :storage, :precision => 10, :scale => 2
      t.float :bandwidth, :precision => 10, :scale => 2
      t.float :operating_system, :precision => 10, :scale => 2
      t.float :paas_category, :precision => 10, :scale => 2
      t.float :saas_category, :precision => 10, :scale => 2

      t.timestamps null: false
    end
  end
end
