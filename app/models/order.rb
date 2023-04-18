class Order < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :delivery_person, class_name: 'User', foreign_key: 'delivery_person_id', optional: true

  validates :number, :phone, :description, :creator_id, presence: true
  validates :number, uniqueness: true

  validate :acceptable_datetime

  state_machine initial: :pending do
    state :pending
    state :in_delivery
    state :delivered

    event :accepted do
      transition pending: :in_delivery, if: ->(order) {order.delivery_person_id.present?} 
    end

    event :done do
      transition in_delivery: :delivered
    end
  end

  private

  def acceptable_datetime
    return if delivery_time_start.blank? && delivery_time_end.blank?

    if delivery_time_start.present? && delivery_time_start <= Time.current
      errors.add(:base, I18n.t('models.order.acceptable_datetime.flash.base.alert_start'))
    end 

    if delivery_time_end.present? && delivery_time_end <= Time.current
      errors.add(:base, I18n.t('models.order.acceptable_datetime.flash.base.alert_end'))
    end

    if delivery_time_start.present? && delivery_time_end.present? && 
      delivery_time_start > delivery_time_end
      errors.add(:base, I18n.t('models.order.acceptable_datetime.flash.base.alert_difference'))
    end
  end
end
