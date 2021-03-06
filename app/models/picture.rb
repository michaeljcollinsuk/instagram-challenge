class Picture < ActiveRecord::Base

  has_attached_file :image, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "200x200>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
