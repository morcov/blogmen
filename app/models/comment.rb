class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :users

  def get_parent_name
   User.find(self.user_id).login
  end
end
