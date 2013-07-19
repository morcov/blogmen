class Post < ActiveRecord::Base
  acts_as_list :column => :position

  belongs_to :users
  has_many :comments, dependent: :destroy
    validates :title, presence: true,
                    length: { minimum: 3 }

  def get_parent_name
   User.find(self.user_id).login
  end

end
