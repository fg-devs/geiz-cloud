class CloudServicesController < ApplicationController

  # Authorization with CanCanCan
  load_and_authorize_resource

  # GET cloud_services
  def index
    @cloud_service_types = CloudServiceTypeService::GetAll.build.call
    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
    @operating_systems = OperatingSystemService::GetAll.build.call

    @filter_settings = {}
    @filter_settings[:currency] = I18n.t('number.currency.format.unit')
    @filter_settings[:maxPrice] = CloudServiceService::GetMaxValueByAttribute.build.call(:price)
    @filter_settings[:maxRAM] = IaasAttributeService::GetMaxValueByAttribute.build.call(:ram)
    @filter_settings[:maxCPU] = IaasAttributeService::GetMaxValueByAttribute.build.call(:cpu)
    @filter_settings[:maxStorage] = IaasAttributeService::GetMaxValueByAttribute.build.call(:storage)
    @filter_settings[:maxBandwidth] = IaasAttributeService::GetMaxValueByAttribute.build.call(:bandwidth)
  end


  # GET cloud_services/:id
  def show
    @cloud_service = CloudServiceService::GetSingle.build.call(params[:id])
  end


  # GET cloud_services/filter
  #
  # Responds to JS only (AJAX)
  def filter
    if filter_params[:cloud_service_type_id].empty?
      @cloud_services = :select_type
    else
      @cloud_services = CloudServiceService::GetFiltered.build.call(filter_params)
    end
  end



  private

  def filter_params
    params.require(:cloud_service).permit(:cloud_service_type_id, :price, paas_category_ids: [], saas_category_ids: [],
                                          iaas_attributes: [:ram, :cpu, :storage, :bandwidth, :operating_system_id])
  end


end
