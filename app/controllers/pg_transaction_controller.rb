class PgTransactionController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  skip_before_action :verify_authenticity_token

  def create
    @pg_transaction = PgTransaction.new
    if params[:details]
      cart_id = params[:cart_id]
      charge_id = params["details"]["purchase_units"]["0"]["payments"]["captures"]["0"]["id"]
      charge_amount = params[:details][:purchase_units]["0"][:payments]["captures"]["0"]["amount"]["value"]
      @pg_transaction.status = "paid"
      @pg_transaction.charge_id = charge_id
      @pg_transaction.charge_amount = charge_amount
      @pg_transaction.cart_id = cart_id
      @pg_transaction.total_delivery_fee = params[:total_delivery_fee]
      @pg_transaction.payment_type = "paypal"
      if @pg_transaction.save
        Cart.find_by_id(cart_id).update(status: "done")
        redirect_to pg_transaction_index_path
      else
        flash[:danger] = "Có lỗi xảy ra trong quá trình thanh toán"
        redirect_to cart_checkout_path
      end
    end
  end

  def index
    @pg_transactions = PgTransaction.all.order(id: "desc")
  end

  private

  def check_role
    unless current_user.buyer?
      redirect_to root_path
    end
  end
end
