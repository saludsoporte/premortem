class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validate :validate_username
  validate :username  
  validate :username  
  attr_writer :login

  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)
    result = if valid_password?(current_password)
        update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password,current_password.blank? ? :blank : :invalid)
      false
    end
    clean_up_passwords
    result
  end

  def login    
    @login || self.username #|| self.email
    logger.debug "********** LOGIN ******************"+@login.to_s
    
    #logger.debug "********** LOGIN ******************"+@password.to_s
  end

  def self.find_for_database_authentication(warden_conditions)    
    conditions = warden_conditions.dup    
    login1 = conditions.delete(:login)    
    if login = login1                       
      where(conditions.to_h).where(["lower(username) = :value ", { :value => login.downcase }]).first           
    elsif conditions.has_key?(:username) #|| conditions.has_key?(:email)            
      where(conditions.to_h).first           
    end    
  end
  def validate_username    
    if User.where(email: username).exists?       
      errors.add(:username, :invalid)
    end
  end

  def valid_password?(password)    
    Devise::Encryptor.compare(self.class, encrypted_password, password)
  end 
end
