class User < ApplicationRecord
  OMNIAUTH_PROVIDERS = %W(#{Settings.omniauth.facebook}
  #{Settings.omniauth.google_oauth2}).freeze
  USER_PARAMS = %i(name email password avatar).freeze

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: OMNIAUTH_PROVIDERS.map(&:to_sym)

  before_create :add_default_avatar, only: %i(create update)

  has_many :courses, dependent: :destroy
  has_many :learnings, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :active_relationships, class_name: Follower.name, foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name: Follower.name, foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :order_by_column, ->(column){order(column)}

  has_one_attached :avatar

  class << self
    def new_with_session params, session
      super.tap do |user|
        OMNIAUTH_PROVIDERS.each do |provider|
          if data = session["devise.#{provider}_data"] &&
              session["devise.#{provider}_data"]["extra"]["raw_info"]
            next unless user.email.blank?
            user.email = data["email"]
            user.
            break
          end
        end
      end
    end

    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[Settings.user.min_password_length, Settings.user.max_password_length]
        user.name = auth.info.name
      end
    end
  end

  def following? current_user_id, user_id
    Follower.find_by(follower_id: current_user_id, followed_id: user_id).blank?
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def current_user? user
    self == user
  end

  private

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.png")), filename: "default.png" , content_type: "image/png")
    end
  end
end
