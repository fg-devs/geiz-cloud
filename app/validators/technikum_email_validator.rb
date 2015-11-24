class TechnikumEmailValidator < ActiveModel::Validator

  def validate(record)

    # If email empty, domain can not be validated
    return if record.email.blank?

    # returns the email domain name
    domain = record.email.split('@').last

    if domain != 'technikum-wien.at'
      record.errors[:base] << I18n.t('activerecord.errors.models.user.attributes.email.tw_invalid')
    end
  end

end