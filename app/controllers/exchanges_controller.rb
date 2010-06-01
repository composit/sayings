class ExchangesController < ApplicationController
  def show
    @exchange = Exchange.find( params[:id] )
    authorize! :read, @exchange
  end

  def create
    @exchange = Entry.find( params[:entry_id] ).comments.find( params[:comment_id] ).new_exchange
    authorize! :create, @exchange
    @exchange.save!
    response = Response.new( params[:exchange][:responses_attributes][0] )
    @exchange.responses << response
    response.save
    redirect_to entries_path, :notice => "Response was successfully created"
  end
end
