# frozen_string_literal: true

require 'csv'

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts
  end

  def show; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
  end

  def import
    Contact.import(params[:file], current_user)
    redirect_to contacts_path, notice: 'Contacts Added Successfully'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:email, :name, :birth_date, :phone, :address, :credit_card, :card_type, :user_id)
  end
end
