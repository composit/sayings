module ApplicationHelper
  def error_messages_for( object )
    if( object.errors.any? )
      message = "<div id='error-explanation'>"
      message += "<h2>#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.model_name.human.downcase} from being saved:</h2>"
      message += "<ul>"
      object.errors.full_messages.each do |msg|
        message += "<li>#{msg}</li>"
      end
      message += "</ul>"
      message += "<div>"
      return message.html_safe
    end
  end
end
