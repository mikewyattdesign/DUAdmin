class Entrant < ActiveRecord::Base
    AGE_OF_RESPONSIBILITY = 21

    validates_presence_of :name
    validates :email, presence: true

    has_many :entries

    def underage?
        birthdate.present? && birthdate > AGE_OF_RESPONSIBILITY.years.ago
    end
end
