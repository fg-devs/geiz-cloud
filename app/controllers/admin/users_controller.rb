class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_is_admin


  # GET admin/users
  def index
    users = Services::User::GetAll.build.call
    @users = users.page(params[:page]).per(10)
  end


  # GET admin/users/:id/edit
  def edit
    @user = Services::User::GetSingle.build.call(params[:id])
  end

  # PUT admin/users/:id
  # PATCH admin/users/:id
  def update
    success, @user = Services::User::Update.build.call(params[:id], user_params)

    if success
      redirect_to(admin_users_path, flash: { success: I18n.t('user_administration.user_updated') })
    else
      render 'edit'
    end
  end


  # DELETE admin/users/:id
  def activate_or_deactivate
    success, @user = Services::User::ChangeStatus.build.call(params[:id])

    if success
      redirect_to(admin_users_path, flash: { success: I18n.t('user_administration.status_updated') })
    else
      render 'index'
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
