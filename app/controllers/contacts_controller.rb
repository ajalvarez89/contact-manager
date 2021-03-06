# frozen_string_literal: true
require 'csv'

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  def index
    @contacts = current_user.contacts
  end

  # GET /contacts/1 or /contacts/1.json
  def show
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

  def destroy
    @contact.destroy
    # respond_to do |format|
    #   format.html { redirect_to contacts_path, notice: "Contact was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  def import
    Contact.import(params[:file])
    redirect_to contacts_path, notice: 'Contacts Added Successfully'
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:email, :name, :birth_date, :phone, :address, :credit_card, :card_type, :user_id)
  end
end
