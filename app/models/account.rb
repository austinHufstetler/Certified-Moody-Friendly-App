class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :accountable, polymorphic: true

  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ACCOUNT_TYPES=["Military", "Business", "Chamber"]
  attr_accessor :type

  def active_for_authentication? 
    (super && approved?) || (accountable_type != "Business")
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

end
