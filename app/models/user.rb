class User < ApplicationRecord
    VALID_US_STATES = [
      'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut',
      'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa',
      'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan',
      'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
      'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma',
      'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee',
      'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ]

    has_secure_password
    validates :username, presence: true, length: { minimum: 6, maximum: 32 }, uniqueness: true
    validates :email, presence: true, format: { with: /^(.+)@(.+)$/, message: 'Email invalid', multiline: true },
    uniqueness: { case_sensitive: false },length: { minimum: 4, maximum: 254 }
    validate :us_state_validator

    self.inheritance_column = :_type_disabled
    
    def us_state_validator
        errors.add(:state, 'please provide a valid US state.') unless VALID_US_STATES.include? state.titleize
    end
end
