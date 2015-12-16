class ChangeCsAttributeWeightingsColumns < ActiveRecord::Migration
  def change
    change_table :cs_attribute_weightings do |t|
      t.remove :price, :operating_system, :paas_category, :saas_category
    end
  end
end
