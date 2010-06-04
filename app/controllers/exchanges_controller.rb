class ExchangesController < ApplicationController
  def index
    authorize! :read, Exchange
    @exchanges = Exchange.order_by( [:created_at, :desc] )
  end

  def new
    @exchange = Exchange.new
    @exchange.users << current_user
    authorize! :create, @exchange
  end

  def show
    authorize! :read, Exchange
    @exchange = Exchange.find( params[:id] )
    @exchange.entries.each { |entry| puts "controller entry: #{entry.content} - #{entry.comments.length}" }
  end

  def create
    if( params[:comments_id] )
      @exchange = Entry.find( params[:entry_id] ).comments.find( params[:comment_id] ).new_exchange
    else
      @exchange = Exchange.new
      @exchange.users << current_user
    end
    authorize! :create, @exchange
    @exchange.save!
    entry = @exchange.entries.build( params[:exchange][:entry] )
    entry.user = current_user
    entry.save!
    redirect_to exchanges_path, :notice => "Exchange was successfully created"
  end
end
