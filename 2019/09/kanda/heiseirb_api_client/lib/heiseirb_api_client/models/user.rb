
class User
  attr_accessor :name, :email, :password, :role

  def initialize(hash)
    @name = hash['name']
    @email = hash['email']
    @password = hash['password']
    @role = hash['role']
  end
end