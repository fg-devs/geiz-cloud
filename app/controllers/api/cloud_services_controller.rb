# RESTful API for Cloud Service actions.
#
# <b>Authorization:</b>
#   Authorization: Token token="<your-api-token>"
#
# <b>Set request content type:</b>
#   Content-Type: application/json
#   or
#   Content-Type: application/xml
#
# <b>Set response content type:</b>
#   Accept: application/json
#   or
#   Accept: application/xml
#
# @author GeizCloud
class Api::CloudServicesController < Api::BaseController

  # Accept JSON and XML
  respond_to :json, :xml

  # Authorization with CanCanCan
  load_and_authorize_resource


  # Creates a new cloud service
  #
  # ---
  #
  # <b>Callable via:</b>
  #   POST /api/cloud_services
  #
  # <b>Example with curl:</b>
  #   curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Token token='BnLZYkTx5o7FM6k9isD6'" -X POST localhost:3000/api/cloud_services
  #
  # ---
  #
  # <b>Possible Cloud Service Types:</b>
  #   1 Infrastructure as a Service (IaaS)
  #   2 Platform as a Service (PaaS)
  #   3 Software as a Service (SaaS)
  #
  # ---
  #
  # <b>Required JSON structure to create IaaS Cloud Service:</b>
  #   {
  #     "cloud_service": {
  #       "cloud_service_type_id": 1,
  #       "title": "<title>",
  #       "short_description": "<short-description>",
  #       "long_description": "<long-description>",
  #       "provider_url": "http://www.example.com/iaas",
  #       "price": 100.00,
  #       "iaas_attribute_attributes": {
  #         "operating_system_id": 1,
  #         "ram": 1024,
  #         "cpu": 4.0,
  #         "storage": 50000,
  #         "bandwidth": 54.00
  #       }
  #     }
  #   }
  #
  # <b>Possible Operating Systems:</b>
  #   1 Windows
  #   2 Linux
  #   3 OS X Server
  #
  # ---
  #
  # <b>Required JSON structure to create PaaS Cloud Service:</b>
  #   {
  #     "cloud_service": {
  #       "cloud_service_type_id": 2,
  #       "title": "<title>",
  #       "short_description": "<short-description>",
  #       "long_description": "<long-description>",
  #       "provider_url": "http://www.example.com/paas",
  #       "price": 100.00,
  #       "paas_category_ids": [1, 4, 5]
  #     }
  #   }
  #
  # <b>Possible PaaS Category IDs:</b>
  #   1 Monitoring und Alarmierung
  #   2 Betrieb und Deployment
  #   3 Skalierung
  #   4 APIs und Developer Tools
  #   5 Standards und Übertragbarkeit
  #   6 Security
  #
  # ---
  #
  # <b>Required JSON structure to create SaaS Cloud Service:</b>
  #   {
  #     "cloud_service": {
  #       "cloud_service_type_id": 3,
  #       "title": "<title>",
  #       "short_description": "<short-description>",
  #       "long_description": "<long-description>",
  #       "provider_url": "http://www.example.com/saas",
  #       "price": 100.00,
  #       "saas_category_ids": [1, 4, 5]
  #     }
  #   }
  #
  # <b>Possible PaaS Category IDs:</b>
  #   1 Kollaboration
  #   2 Customer Relationship Management (CRM)
  #   3 Enterprise Resource Planning (ERP)
  #   4 Rechnungswesen/Buchhaltung
  #   5 Projektmanagement
  #   6 E-Mail Marketing
  #   7 Webhosting
  #   8 Personalwesen (HR)
  #
  #
  # @return [JSON|XML] The created cloud service or error messages
  def create
    new_cs = cloud_service_params
    new_cs[:active] = false # Set as inactive, cloud service must be approved by administrator

    success, cloud_service = CloudServiceService::Create.build.call(current_user, new_cs)

    respond_with cloud_service
  end




  private

  # Catch ParameterMissing exception
  rescue_from ActionController::ParameterMissing do |exception|
    render json: { message: exception.message }, :status => 400
  end


  # Strong parameters for cloud service
  def cloud_service_params
    params.require(:cloud_service).permit(:cloud_service_type_id, :title, :short_description, :long_description,
                                          :provider_url, :price,
                                          iaas_attribute_attributes: [:operating_system_id, :ram, :cpu, :storage, :bandwidth],
                                          paas_category_ids: [], saas_category_ids: [])
  end

end
