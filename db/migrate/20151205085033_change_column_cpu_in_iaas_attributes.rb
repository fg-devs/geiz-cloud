class ChangeColumnCpuInIaasAttributes < ActiveRecord::Migration
  def change
    change_column :iaas_attributes, :cpu, :decimal, :precision => 10, :scale => 2
  end
end
