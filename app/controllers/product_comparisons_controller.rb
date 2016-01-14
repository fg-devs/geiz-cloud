class ProductComparisonsController < ApplicationController

  # GET /product_comparisons
  def index

    # Handle authorization manually since ProductComparison Model uses no DB-Table
    authorize! :index, ProductComparison

    success, @cloud_services = ProductComparisonService::GetAll.build(session).call

    @paas_categories = PaasCategoryService::GetAll.build.call
    @saas_categories = SaasCategoryService::GetAll.build.call
  end

  # POST /product_comparison
  def create

    # Handle authorization manually since ProductComparison Model uses no DB-Table
    authorize! :create, ProductComparison

    # Get Cloud Service to add
    cloud_service = CloudServiceService::GetSingle.build.call(params[:cloud_service_id])

    success, @message = ProductComparisonService::Add.build(session).call(cloud_service)

    render partial: 'product_comparisons/partials/create_modal'
  end


  # DELETE /product_comparison/:id
  def destroy

    # Handle authorization manually since ProductComparison Model uses no DB-Table
    authorize! :destroy, ProductComparison

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

    # Handle authorization manually since ProductComparison Model uses no DB-Table
    authorize! :empty, ProductComparison

    # Empty product comparison
    ProductComparisonService::Empty.build(session).call

    # Redirect
    redirect_to(product_comparisons_url, flash: { success: I18n.t('product_comparison.all_products_removed') })
  end

end
