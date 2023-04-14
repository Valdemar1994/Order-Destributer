class Order < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :delivery_person, class_name: 'User', foreign_key: 'delivery_person_id', optional: true

  validates :number, :phone, :description, :creator_id, presence: true
  validates :number, uniqueness: true

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
end
