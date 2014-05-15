class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :hashed_password, type: String
  has_many :children

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.hashed_password = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.hashed_password) == test_password
      self
    else
      false
    end
  end

end
