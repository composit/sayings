class UrlExistsValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    begin # check header response
      case Net::HTTP.get_response(URI.parse(value))
        when Net::HTTPSuccess then true
        # else r.errors.add(a, configuration[:message]) and false
        else object.errors[attribute] << ( options[:message] || 'is not formatted properly or is not responding.' ) and false
      end
    rescue # Recover on DNS failures..
      # r.errors.add(a, configuration[:message]) and false
      object.errors[attribute] << ( options[:message] || 'is not formatted properly or is not responding.' ) and false
    end
  end
end
