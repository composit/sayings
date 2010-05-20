module EntriesHelper
  def format_content( content )
    # allow only tags specified in tags options, likewise in attributes
    content = sanitize( content, :tags => %w(b strong i em img), :attributes => %w(src) )
    
    # add support for line breaks
    content = simple_format( content )
    
    # auto link URL's and emails
    content = auto_link( content, :all, :target => '_blank' )
    
    return( content )
  end
end
