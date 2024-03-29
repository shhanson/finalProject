class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :reviews, :dependent => :destroy
  
  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                       :length => { :maximum => 40 }
             
  validates :email, :presence => true,
                    :format => { :with => email_regexp },
                    :uniqueness => { :case_sensitive => false }
                    
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 5..40 }
                       
  self.per_page = 10
                       
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  def add_review!(restaurant,content)
    reviews.create!(:content => content, :user_id => id, :restaurant_id => restaurant.id)
  end
  
  private
    def encrypt_password
     self.salt = make_salt if new_record?
     self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
  
end
