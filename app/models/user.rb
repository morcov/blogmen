class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :login,
   :presence =>TRUE,
   :length => {
    :minimum => 2,
    :allow_blank => TRUE
   }

   validates :email,
   :presence => TRUE
 #  :uniqueness => TRUE

   validates :password,
   :presence =>TRUE,
   :length => {
    :minimum => 6,
    :allow_blank => TRUE
   },
   :confirmation => TRUE

    validates :password_confirmation,
   :presence =>TRUE

  has_secure_password
  validates_presence_of :password, :on => :create

  def get_count_posts
   Post.where(user_id: self.id).count
  end

  def get_count_comments
   Comment.where(user_id: self.id).count
  end

end
