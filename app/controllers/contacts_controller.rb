# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:email, :name, :birth_date, :phone, :address, :credit_card, :card_type, :user_id)
  end
end
