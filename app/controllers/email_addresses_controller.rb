class EmailAddressesController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]

  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  def edit
  end

  def create
    @email_address = EmailAddress.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully created.' }
        format.json { render :show, status: :created, location: @email_address }
      else
        format.html { render :new }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_address }
      else
        format.html { render :edit }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to @email_address.contact, notice: 'Email address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def email_address_params
      params.require(:email_address).permit(:address, :contact_id, :contact_type)
    end
end
