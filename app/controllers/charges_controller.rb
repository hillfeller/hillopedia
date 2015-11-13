class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 15_00
    }

    @stripe_btn_data2 = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership Downgrade- #{current_user.name}",
      amount: 0_00
    }
  end



  def create
    if current_user.role == "standard"
      customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: 15_00,
        description: "BigMoney Membership - #{current_user.email}",
        currency: 'usd'
      )

      current_user.premium!
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      redirect_to user_path(current_user)

    elsif current_user.role == "premium"
      current_user.standard!
      redirect_to user_path(current_user)

    else
      redirect_to user_path(current_user)

    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
