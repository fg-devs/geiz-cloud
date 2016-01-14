class CloudService < ActiveRecord::Base

  # Relationships
  belongs_to :cloud_service_type
  belongs_to :user

  # Only if type is Iaas
  has_one :iaas_attribute
  accepts_nested_attributes_for :iaas_attribute

  # Only if type is PaaS
  has_and_belongs_to_many :paas_categories

  # Only if type is SaaS
  has_and_belongs_to_many :saas_categories

  # Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :long_description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :provider_url, presence: true, length: { maximum: 255 }

  # IaaS must not be validated. It is a different kind of association and has its own validations
  validates :paas_categories, presence: true, if: :should_validate_paas?
  validates :saas_categories, presence: true, if: :should_validate_saas?


  # Should PaaS be validated?
  def should_validate_paas?
    cloud_service_type_id == CloudServiceType::PAAS_ID
  end

  # Should SaaS be validated?
  def should_validate_saas?
    cloud_service_type_id == CloudServiceType::SAAS_ID
  end


  #######################
  # Scopes for querying
  #######################

  # By status
  scope :by_status, ->(status) {
    if status == nil
      all
    else
      where(active: status)
    end
  }

  # By Cloud Service Type
  scope :by_cs_type, ->(cs_type_id) {
    if cs_type_id.blank?
      all
    else
      where(cloud_service_type_id: cs_type_id)
    end
  }

  # By Price
  scope :by_price, ->(price) {
    if price.blank?
      all
    else
      where(price: price[0]..price[1])
    end
  }

  # By Operating System
  scope :by_operating_system, ->(os_id) {
    if os_id.blank?
      all
    else
      joins(:iaas_attribute).where(iaas_attributes: { operating_system_id: os_id })
    end
  }

  # By RAM
  scope :by_ram, ->(ram) {
    if ram.blank?
      all
    else
      joins(:iaas_attribute).where(iaas_attributes: { ram: ram[0]..ram[1] })
    end
  }

  # By CPU
  scope :by_cpu, ->(cpu) {
    if cpu.blank?
      all
    else
      joins(:iaas_attribute).where(iaas_attributes: { cpu: cpu[0]..cpu[1] })
    end
  }

  # By Storage
  scope :by_storage, ->(storage) {
    if storage.blank?
      all
    else
      joins(:iaas_attribute).where(iaas_attributes: { storage: storage[0]..storage[1] })
    end
  }

  # By Bandwidth
  scope :by_bandwidth, ->(bandwidth) {
    if bandwidth.blank?
      all
    else
      joins(:iaas_attribute).where(iaas_attributes: { bandwidth: bandwidth[0]..bandwidth[1] })
    end
  }

  # By PaaS category
  scope :by_paas_categories, ->(paas_category_ids) {
    if paas_category_ids.blank?
      all
    else
      joins(:paas_categories).where(cloud_services_paas_categories: { paas_category_id: paas_category_ids }).uniq
    end
  }

  # In SaaS category
  scope :by_saas_categories, ->(saas_category_ids) {
    if saas_category_ids.blank?
      all
    else
      joins(:saas_categories).where(cloud_services_saas_categories: { saas_category_id: saas_category_ids }).uniq
    end
  }

  # By user role created
  scope :created_by_role, ->(roles) {
    if roles.nil?
      all
    else
      includes(user: :roles).where(roles: { name: roles })
    end
  }

end
