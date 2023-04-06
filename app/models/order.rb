class Order < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :delivery_person, class_name: 'User', foreign_key: 'delivery_person_id', optional: true
end
