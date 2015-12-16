class ProductComparisonsController < ApplicationController

  before_action :authenticate_user!

  # GET /product_comparisons
  def index
    success, @cloud_services = ProductComparisonService::GetAll.build(session).call

    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
  end

  # POST /product_comparison
  def create

    # Get Cloud Service to add
    cloud_service = CloudServiceService::GetSingle.build.call(params[:cloud_service_id])

    success, @message = ProductComparisonService::Add.build(session).call(cloud_service)

    render partial: 'product_comparisons/partials/create_modal'
  end


  # DELETE /product_comparison/:id
  def destroy
    # Remove id
    success_remove, message = ProductComparisonService::Remove.build(session).call(params[:id])

    # Redirect with flash message
    if success_remove
      redirect_to(product_comparisons_url, flash: { success: message })
    else
      redirect_to(product_comparisons_url, flash: { error: message })
    end
  end


  # DELETE /product_comparisons/empty
  def empty
    # Empty product comparison
    ProductComparisonService::Empty.build(session).call

    # Redirect
    redirect_to(product_comparisons_url, flash: { success: I18n.t('product_comparison.all_products_removed') })


  end

end
