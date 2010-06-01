class AllowsCommentsValidator < ActiveModel::Validator
  def validate( record )
    record.errors[:base] << "Comments are not allowed for this record" if( record == record.exchange.responses.first && record.comments.length > 0 )
  end
end
