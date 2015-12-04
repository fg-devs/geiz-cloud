class AddOperatingSystemRefToIaasAttributes < ActiveRecord::Migration
  def change
    add_reference :iaas_attributes, :operating_system, index: true, foreign_key: true
  end
end
