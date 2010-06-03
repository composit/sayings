class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    if( params[:exchange_id] )
      @comment.commentable = Exchange.find( params[:exchange_id] ).responses.find( params[:response_id] )
    else
      @comment.commentable = Entry.find( params[:entry_id] )
    end
    @comment.user = current_user
    follow_up_path = ( @comment.commentable.class == Entry ? entries_path : exchange_path( @comment.commentable.exchange ) )
    if( @comment.save )
      redirect_to follow_up_path, :notice => "Comment was successfully created"
    else
      redirect_to follow_up_path, :alert => "There was an error creating your comment"
    end
  end
end
