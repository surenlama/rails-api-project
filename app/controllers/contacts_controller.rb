class ContactsController < ApplicationController
  
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  def show
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    puts 'prams #'

    return if @contact.save
    render json: @contact.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /contacts/1
  def update
    return if @contact.update(contact_params)
      render json: @contact.errors, status: :unprocessable_entity
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "contact not found!" }, :status => 404
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    puts ":::::::::::#{params}"
    params.permit(:first_name, :last_name, :email, :image, :status)
  end
end