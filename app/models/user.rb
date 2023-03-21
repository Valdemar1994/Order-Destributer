class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :single_role_selection
    
  private 

  def single_role_selection
    if self.manager == true && self.distributor == true
      errors.add(:base, I18n.t('models.user.single_role_selection.flash.base.alert'))
      throw(:abort)
    end
  end
end
