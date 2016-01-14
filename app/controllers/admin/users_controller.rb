class Admin::UsersController < Admin::BaseController

  # Authorization with CanCanCan
  load_and_authorize_resource


  # GET admin/users
  def index
    @users = UserService::GetAll.build.call([:admin, :user])
  end


  # GET admin/api_users
  def index_api
    @user = User.new
    @api_users = UserService::GetAll.build.call([:api])
  end


  # POST admin/api_user
  def create_api
    success, @user = UserService::Create.build.call(user_params, :api)

    if success
      redirect_to(api_admin_users_url, flash: { success: I18n.t('user_administration.api_user_created') })
    else
      @api_users = UserService::GetAll.build.call([:api])
      render 'index_api'
    end
  end


  # GET admin/users/:id/edit
  def edit
    @user = UserService::GetSingle.build.call(params[:id])
  end

  # PUT admin/users/:id
  # PATCH admin/users/:id
  def update
    success, @user = UserService::Update.build.call(params[:id], user_params)

    if success
      redirect_to(admin_users_url, flash: { success: I18n.t('user_administration.user_updated') })
    else
      render 'edit'
    end
  end


  # POST admin/users/:id/toggle_status
  def toggle_status
    redirect_location = params[:redirect_location].to_sym
    success, @user = UserService::ChangeStatus.build.call(params[:id])

    if success
      if redirect_location == :index
        redirect_to(admin_users_path, flash: { success: I18n.t('user_administration.status_updated') })
      elsif redirect_location == :index_api
        redirect_to(api_admin_users_path, flash: { success: I18n.t('user_administration.status_updated') })
      end
    else
      render 'index'
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email)
  end

end
