class EntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @entries = Entry.order_by( [:created_at, :desc] )
  end

  def new
  end

  def create
    @entry.user = current_user
    if( @entry.save )
       redirect_to entries_path, :notice => "Entry was successfully created"
    else
      render "new"
    end
  end
end
