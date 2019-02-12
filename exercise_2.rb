class User
  def initialize(name, bio, age, password, authenticator = Authenticator.new)
    @name = name
    @bio = bio
    @age = age
    @password = password
    @authenticator = authenticator
  end

  def authenticate(candidate_password)
    @authenticator.authenticate(@password, candidate_password)
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end

class Authenticator
  def authenticate(_password, candidate_password)
    return true if candidate_password == @assword

    false
  end
end
