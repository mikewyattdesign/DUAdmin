class Entrant < ActiveRecord::Base
    AGE_OF_RESPONSIBILITY = 21

    validates_presence_of :name, :birthdate, :street_address, :zipcode
    validates :phone, presence: true, phone: true
    validates :email, presence: true

    has_many :entries

    def underage?
        birthdate.present? && birthdate > AGE_OF_RESPONSIBILITY.years.ago
    end
end
