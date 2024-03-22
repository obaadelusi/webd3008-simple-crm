class CustomersController < InheritedResources::Base

  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.order("LOWER(fullname)")
  end

  def missing_email
    @customers = Customer.where(email: [nil, ''])
  end

  private

    def customer_params
      params.require(:customer).permit(:fullname, :phone, :email, :notes)
    end

end
