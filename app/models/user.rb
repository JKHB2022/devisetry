class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name  
    end
  end
         # authentication_keys: [:login]

  # attr_accessor :login

  # def login
  #   @login || self.name || self.email
  # end


  private
  def after_confirmation
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end

  # def self.find_for_database_authentication(warden_condition)
  #   condion = warden_condition.dup
  #   if(login = conditions_delete(:login))
  #     where(condions.to_h).where([" lower(email)=:value",{value: login.downcase}]).first
  #   elsif conditions.has_key?(:email)
  #     where(conditions.to_h).first
  #   end
  # end
end
