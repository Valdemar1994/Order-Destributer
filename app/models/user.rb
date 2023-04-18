class User < ApplicationRecord
  before_create :single_role_selection

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, inverse_of: 'creator', foreign_key: 'creator_id'

  has_one_attached :avatar

  validate :acceptable_image

  private 

  def single_role_selection
    if self.manager == true && self.distributor == true
      errors.add(:base, I18n.t('models.user.single_role_selection.flash.base.alert'))
      throw(:abort)
    end
  end

  def acceptable_image
    return unless avatar.attached?
  
    unless avatar.blob.byte_size <= 0.5.megabyte
      errors.add(:base, I18n.t('models.user.acceptable_image.flash.base.avatar_size'))
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:base, I18n.t('models.user.acceptable_image.flash.base.avatar_format'))
    end
  end
end
