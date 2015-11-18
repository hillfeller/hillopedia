class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  # scope :private_visible_to, -> (user) { user ? user.role == "admin" || user.role == "premium" : where(private: true) }


end
