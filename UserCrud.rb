module UserCrud
  require 'bcrypt'

  puts "Module UserCrud activated"
  
  def self.create_hash(password)
    BCrypt::Password.create(password)
  end
  
  def self.verify_hash(password)
    BCrypt::Password.new(password)
  end
  
  def self.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash(user_record[:password])
    end
    list_of_users
  end
  
  def self.authenticate_user(name, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:name] == name && verify_hash(user_record[:password]) == password
        puts "valid"
        return user_record
      end
    end
    puts "user or password is wrong.."
  end
end