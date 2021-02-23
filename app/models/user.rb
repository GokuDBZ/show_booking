class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_reader :ability

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def ability
  	@ability = Ability.new(self)
  end

  def admin?
  	self.admin == true
  end
end
