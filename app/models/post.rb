class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
  validates :title, presence:true


  def Post.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
  
  def total_like
    likes.count
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end


  scope :search, ->(search){
    where("title LIKE ?","%#{search}%")
  }

end
