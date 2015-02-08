class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.auth_token_confirm(@user).deliver
      render json: @user, status: :created, location: [:api, @user]
    else
      render json: { errors: @user.errors }, status: :created
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render json: @user, status: :ok, location: [:api, @user]
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :username)
    end
end
