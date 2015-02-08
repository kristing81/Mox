class ChargesController < ApplicationController
  
  def new
    @amount = 500
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Mox Credits",
      amount: @amount
   }
  end  
  def create
    @amount = 500
 
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken],
   )
 
   
   charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: @amount,
     description: "Mox Credits",
     currency: 'usd'
   )
 
   flash[:success] = "You now have 500 credits #{current_user.email}!  Each request is 1 credit."
   current_user.credit_balance(5)
   current_user.save
   redirect_to user_path(current_user)
 
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
