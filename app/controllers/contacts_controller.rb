class ContactsController < ApplicationController
  def index
  end

  def submit
    @contact_model = Contact.new(contact_params)
    if @contact_model.valid?
      ContactsMailer.submited_form(@contact_model).deliver_now
      redirect_to tests_path, notice: "Thank you for your feedback! We'll contact you soon!"
    else
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :text)
  end
end
