class EntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @entries = Entry.all
  end
end
