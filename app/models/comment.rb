class Comment < ActiveRecord::Base
  # Means you can comment on anything.
  belongs_to :commentable, polymorphic:true

  # tie this to a user
  belongs_to :user
end
