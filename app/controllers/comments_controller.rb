class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment.entry = Entry.find( params[:entry_id] )
    if( @comment.save )
      redirect_to entries_path, :notice => "Comment was successfully created"
    else
      redirect_to entries_path, :alert => "There was an error creating your comment"
    end
  end
end
