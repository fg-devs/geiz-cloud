class CloudServicesController < ApplicationController

  before_action :authenticate_user!

  # GET /
  def index
    cloud_services = CloudServiceService::GetAll.build.call
    @cloud_services = cloud_services.page(params[:page]).per(25)
    @cloud_service_types = CloudServiceTypeService::GetAll.build.call


  end


  # Filter
  def filter
    filtered_cloud_services = CloudServiceService::GetFiltered.build.call(filter_params)

    pp filtered_cloud_services


    render text: "OK", layout: false
  end







  private

  def filter_params
    params.require(:cloud_service).permit(:cloud_service_type_id)
  end


end
