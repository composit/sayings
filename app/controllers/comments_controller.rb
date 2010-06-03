class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    exchange = Exchange.find( params[:exchange_id] )
    @comment.entry = exchange.entries.find( params[:entry_id] )
    @comment.user = current_user
    if( @comment.save )
      redirect_to exchange, :notice => "Comment was successfully created"
    else
      redirect_to exchange, :alert => "There was an error creating your comment"
    end
  end
end
