class Customer < ApplicationRecord

  validates :fullname, presence: true, length: { minimum: 2 }

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "fullname", "id", "id_value", "notes", "phone", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end
