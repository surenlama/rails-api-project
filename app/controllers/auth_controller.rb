class AuthController < ApplicationController

    # POST /login
    def login
      form = AuthLoginForm.new(params)
      return error_validation(form.errors) if form.invalid?
      @user = User.where(email: form.email).first
      return error_unauthorized("Access Denied!") if @user.nil? || BCrypt::Password.new(@user.password) != form.password
      render_success({ "token": @user.token })
    rescue ActiveRecord::RecordNotFound
      error_unauthorized("Access Denied!")
    end
  
  end
  