class User < Sequel::Model
  plugin :validation_helpers

  def validate
    super

    errors.add(:first_name, 'cannot be empty') if !first_name || first_name.empty?
    errors.add(:last_name, 'cannot be empty') if !last_name || last_name.empty?

    validates_presence [:first_name, :last_name]
    validates_format /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}/, :email_address, message: 'is not a valid email'
    validates_includes ['Ireland', 'United States'], :country unless self.country.nil?
  end
end
