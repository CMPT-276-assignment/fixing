class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true

  def to_s
      title
  end

  def self.search(search)
      # if search
      #   where(['title ILIKE ? OR content ILIKE ?', "%#{search}%", "%#{search}%"])
      # else
      # scoped
      # end
    if search
      words = search.to_s.strip.split
      words.map! { |word| "content LIKE '%#{word}%'" }
      sql = words.join(" OR ")
      self.where(sql)
    else
      scoped
    end
  end


  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
