class EntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @entries = Entry.order( "created_at desc" )
  end
end
