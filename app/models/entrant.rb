class Entrant < ActiveRecord::Base
    AGE_OF_RESPONSIBILITY = 21

    validates_presence_of :name, :birthdate, :street_address, :zipcode
    validates :phone, presence: true, phone: true
    validates :email, presence: true, email: true
    validate :cannot_be_a_minor

    def cannot_be_a_minor
        if birthdate.present? && birthdate > AGE_OF_RESPONSIBILITY.years.ago
            errors[:birthdate] << "Not old enough"
        end
    end
end
