class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  MARITAL_STATUSES = %w[single married partner]

  # matches values in ESPlanner
  STATES = { "AL" =>  1, "AK" =>  2, "AZ" =>  3, "AR" =>  4, "CA" =>  5, "CO" =>  6, "CT" =>  7, "DE" =>  8, "DC" =>  9,
    "FL" => 10, "GA" => 11, "HI" => 12, "ID" => 13, "IL" => 14, "IN" => 15, "IA" => 16, "KS" => 17, "KY" => 18, "LA" => 19,
    "ME" => 20, "MD" => 21, "MA" => 22, "MI" => 23, "MN" => 24, "MS" => 25, "MO" => 26, "MT" => 27, "NE" => 28, "NV" => 29,
    "NH" => 30, "NJ" => 31, "NM" => 32, "NY" => 33, "NC" => 34, "ND" => 35, "OH" => 36, "OK" => 37, "OR" => 38, "PA" => 39,
    "RI" => 40, "SC" => 41, "SD" => 42, "TN" => 43, "TX" => 44, "UT" => 45, "VT" => 46, "VA" => 47, "WA" => 48, "WV" => 49,
    "WI" => 50, "WY" => 51 }

  before_save :ensure_authentication_token
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :first_name, length: { maximum: 50 }, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_length_of :password, within: 8..30
  has_one :partner, autosave:true, dependent: :destroy
  accepts_nested_attributes_for :partner
  has_many :children, autosave:true, dependent: :destroy
  accepts_nested_attributes_for :children
  has_many :residences, autosave:true, dependent: :destroy
  accepts_nested_attributes_for :residences


  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def self.marital_status_options
    MARITAL_STATUSES.map{ |s| [s.titleize, s] }
  end

  def self.state_options
    STATES.map { |s| s[0] }
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
