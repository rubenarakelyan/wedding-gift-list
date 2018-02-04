class PayController < ApplicationController
  def index
    @gift = Gift.find(params[:gift_id])
    @paying = validate_paying(@gift, params[:paying])
    @human_paying = human_paying(@paying)
    redirect_to '/' if @paying < 100
  end

  def stripe
    @gift = Gift.find(params[:gift_id])
    guest = Guest.new(name: params[:guest_name], email_address: params[:guest_email_address])

    if guest.valid?
      guest.save!
    else
      flash[:error] = t(:error_missing_guest_name_email_address)
      @paying = validate_paying(@gift, params[:paying])
      @human_paying = human_paying(@paying)
      render action: :index and return
    end

    amount = validate_paying(@gift, params[:paying])
    stripe_charge(@gift, amount, params[:guest_email_address], params[:stripeToken])
    purchased_gift = PurchasedGift.create!(gift: @gift, guest: guest, paid: amount, message: params[:message])
    redirect_to pay_thanks_path(transaction_id: purchased_gift.transaction_id)
  end

  def thanks
    purchased_gift = PurchasedGift.find_by(transaction_id: params[:transaction_id])
    @guest = purchased_gift.guest
    @gift = purchased_gift.gift
  end

private

  def validate_paying(gift, amount)
    amount = amount.to_i * 100
    amount = gift.price_remaining if amount > gift.price_remaining
    amount
  end

  def human_paying(amount)
    amount / 100
  end

  def stripe_charge(gift, amount, email, stripe_token)
    customer = Stripe::Customer.create(
      :email => email,
      :source  => stripe_token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => gift.name,
      :currency    => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to pay_path, gift_id: gift.id, paying: human_paying(amount)
  end
end
