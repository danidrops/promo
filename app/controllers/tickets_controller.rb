class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  require "prawn"

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  # POST /tickets.json
  def create
    # Amount in cents
    @number = params[:ticket][:number].to_i
    @email = params[:stripeEmail]
    @amount = @number * 1000 # CHANGE TICKET PRICE HERE AND IN APPLICATION.JS AND NOTE BELOW

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    @ticket = Ticket.create({ email: @email, number: @number, note: "ONLINE $10"}) #CHANGE TICKET PRICE NOTE HERE
    TicketsMailer.ticket_sender(@ticket).deliver


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:number)
    end

end
