class ContactsController < ApplicationController
  
  before_action :set_contact, only: %i[ show update destroy ]
  require 'csv'

  # GET /contacts
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  def show
  end

  def import_csv
    csv_file = params[:csv_file]
    csv_data = csv_file.read
    if csv_data.present?
      success_count = 0  # To keep track of successful imports
  
      CSV.parse(csv_data, headers: true) do |row|
        contact_params = {
          first_name: row["first_name"],
          last_name: row["last_name"],
          email: row["email"],
          image: row["image"],
        }
  
        @contact = Contact.new(contact_params)
  
        if @contact.save
          success_count += 1
        end
      end
  
      if success_count > 0
        render json: "Successfully imported #{success_count} contacts.", status: :ok
      else
        render json: "No contacts were imported.", status: :unprocessable_entity
      end
    end
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


  def export
    @contacts = Contact.all
    csv_data = CSV.generate(headers: true) do |csv|
      csv << Contact.column_names
      @contacts.each do |contact|
        csv << contact.attributes.values
      end
    end

    send_data csv_data, filename: "contacts.csv", type: "text/csv"
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
