class User < ApplicationRecord
  has_many :transactions
  has_many :stocks, -> { distinct }, through: :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable
  enum role: [:trader, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :first_name, presence: true
  validates :last_name, presence: true

  def set_default_role
    self.role ||= :trader
  end
end
