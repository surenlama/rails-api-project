class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show update destroy ]
  before_action :authenticate_user, except: %i[create]
  require 'bcrypt'
  # GET /user
  def index
    @users = User.all
  end
  # GET /user/self
  def show
    @user = @current_user
  end
  # # POST /user
  def create
    form = UserCreateForm.new(params) #comes from app/form/user_create_form.rb
    #error_validation is inside controller/concerns/error_response.rb
    return error_validation(form.errors) if form.invalid?
    @user = User.new
    @user.first_name = form.first_name
    @user.last_name = form.last_name
    @user.first_name_kana = form.first_name_kana
    @user.last_name_kana = form.last_name_kana
    @user.gender = form.gender
    @user.email = form.email
    @user.password = BCrypt::Password.create(form.password)
    @user.birth_date = form.birth_date
    @user.height = form.height
    @user.weight = form.weight
    @user.set_age(@user.birth_date)
    @user.token = Digest::UUID.uuid_v4
    return error_validation(@user.errors) if @user.invalid?
    @user.save!
  end
  # PATCH/PUT /user/self
  def update
    form = UserUpdateForm.new(params)
    error_validation(form.errors) if form.invalid?
    @user = @current_user
    @user.first_name = form.first_name unless form.first_name.nil?
    @user.last_name = form.last_name unless form.last_name.nil?
    @user.first_name_kana = form.first_name_kana unless form.first_name_kana.nil?
    @user.last_name_kana = form.last_name_kana unless form.last_name_kana.nil?
    @user.gender = form.gender unless form.gender.nil?
    @user.email = form.email unless form.email.nil?
    @user.password = BCrypt::Password.create(form.password) unless form.password.nil?
    @user.birth_date = form.birth_date unless form.birth_date.nil?
    @user.height = form.height unless form.height.nil?
    @user.weight = form.weight unless form.weight.nil?
    @user.set_age(@user.birth_date)
    return error_validation(@user.errors) if @user.invalid?
    @user.save!
  end
  # DELETE /user/self
  def destroy
    @user = @current_user
    @user.destroy
  end
  private
  def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { "error": "user not found!" }, :status => 404
  end
end