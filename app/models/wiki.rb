class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(public: true) }

  has_many :collaborators
  has_many :users, through: :collaborators
  # delegate :users, to: :collaborators

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end
