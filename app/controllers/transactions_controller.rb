class TransactionsController < ApplicationController
  def create
    book = Book.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        amount: book.price
        currency: 'usd'
        card: token
        description: current_user_email
      )

      @sale = book.sales.create!(buyer_email: current_user_email)
      redirect_to pickup_url(uuid: @sale.uuid)

    rescue Stripe::CardError => e
      flash[:notice] = e.message
      redirect_to book_path(book)
    end

  end

  # Success Page
  def pickup
    @sale = Sale.find_by!(uuid: params[:uuid])
    @book = @sale.book
  end
end