class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :consultations

  validates :name, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture,
      content_type: /\Aimage\/.*\z/

  validates :picture, presence: true
end
