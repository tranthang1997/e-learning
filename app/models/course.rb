class Course < ApplicationRecord
  COURSE_PARAMS = %i(name description image).freeze

  before_create :add_default_image, only: %i(create update)

  belongs_to :user
  has_many :words, dependent: :destroy
  has_many :results, dependent: :destroy

  scope :order_by_column, ->(column){order(column)}
  scope :select_id_name_and_desc, ->{select :id, :name, :store_id, :description}

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  private

  def add_default_image
    unless image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.png")), filename: "default.png" , content_type: "image/png")
    end
  end
end
