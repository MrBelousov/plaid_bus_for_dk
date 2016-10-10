class Category < ApplicationRecord
  # Extensions
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Paperclip
  has_attached_file :image, styles: { thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Validates
  validates :name,        presence: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
