class User < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  # has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
