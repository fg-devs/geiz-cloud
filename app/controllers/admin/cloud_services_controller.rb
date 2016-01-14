class Admin::CloudServicesController < Admin::BaseController

  # Authorization with CanCanCan
  load_and_authorize_resource

  # GET admin/cloud_services
  def index
    @cloud_services = CloudServiceService::GetAll.build.call
  end

  # GET admin/cloud_services/release
  def index_release
    @cloud_services = CloudServiceService::GetAll.build.call([:api], false)
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

  # GET admin/cloud_services/:id
  def edit
    @cloud_service = CloudServiceService::GetSingle.build.call(params[:id])
    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
    @operating_systems = OperatingSystemService::GetAll.build.call
  end

  # PUT admin/cloud_services/:id
  # PATCH admin/cloud_services/:id
  def update
    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
    @operating_systems = OperatingSystemService::GetAll.build.call

    success, @cloud_service = CloudServiceService::Update.build.call(params[:id], cloud_service_params)

    if success
      redirect_to(admin_cloud_services_path, flash: { success: I18n.t('cloud_service_administration.cloud_service_updated') })
    else
      render 'edit'
    end
  end


  # POST admin/cloud_services/:id/toggle_status
  def toggle_status
    redirect_location = params[:redirect_location].to_sym
    success, @cloud_service = CloudServiceService::ChangeStatus.build.call(params[:id])

    if success
      if redirect_location == :index
        redirect_to(admin_cloud_services_path, flash: { success: I18n.t('cloud_service_administration.status_updated') })
      elsif redirect_location == :index_release
        redirect_to(release_admin_cloud_services_path, flash: { success: I18n.t('cloud_service_administration.cloud_service_released') })
      end
    else
      render 'index'
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
