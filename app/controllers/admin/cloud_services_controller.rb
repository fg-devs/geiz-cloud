class Admin::CloudServicesController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_is_admin


  # GET admin/cloud_services
  def index
  end

  # GET admin/cloud_services/new
  def new
    @cloud_service = CloudService.new
    @cloud_service.active = 1 # Default value for view
    @cloud_service.iaas_attribute = IaasAttribute.new
    @cloud_service_types = CloudServiceTypeService::GetAll.build.call
    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
    @operating_systems = OperatingSystemService::GetAll.build.call
  end

  # POST admin/cloud_services
  def create
    @cloud_service_types = CloudServiceTypeService::GetAll.build.call
    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
    @operating_systems = OperatingSystemService::GetAll.build.call

    success, @cloud_service = CloudServiceService::Create.build.call(current_user, cloud_service_params)

    if success
      redirect_to(admin_cloud_services_path, flash: { success: I18n.t('cloud_service_administration.cloud_service_created') })
    else
      render 'new'
    end

  end


  private

  def cloud_service_params
    params.require(:cloud_service).permit(:cloud_service_type_id, :title, :short_description, :long_description,
                                          :provider_url, :price, :active,
                                          iaas_attribute_attributes: [:operating_system_id, :ram, :cpu, :storage, :bandwidth],
                                          paas_category_ids: [], saas_category_ids: [])
  end

end