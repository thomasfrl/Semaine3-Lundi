class User
  attr_accessor :email, :name
  @@user_count = 0
  @@user_array = []

  def initialize(email_to_save)
    @email = email_to_save
    @@user_count = @@user_count + 1
    @@user_array << self
  end

  def self.all 
  	return @@user_array
  end

  def self.find_by_email(email)
  	@@user_array.each do |user|
  		return user if user.email == email
  	end
  	return "pas de participant trouvé avec cet email"
  end

  def to_s
  	puts @email
  end
end


=begin
  def change_password(new_password)
    @encrypted_password = encrypt(new_password)
  end

  def show_itself
    puts self
  end

  def self.count
    return @@user_count
  end

  private

  def encrypt(string_to_encrypt)
    return "##ENCRYPTED##"
  end

end

=end