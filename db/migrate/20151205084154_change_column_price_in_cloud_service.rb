class ChangeColumnPriceInCloudService < ActiveRecord::Migration
  def change
    change_column :cloud_services, :price, :decimal, :precision => 10, :scale => 2
  end
end
