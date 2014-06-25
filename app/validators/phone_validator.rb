# app/validators/email_validator.rb

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value.gsub(/\D/,'').length < 10
      record.errors[attribute] << (options[:message] || "invalid phone number")
    end
  end
end