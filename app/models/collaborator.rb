class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  
  # belongs_to :users
  # belongs_to :wikis
  #
  # def self.users
  #   User.where( id: pluck(:user_id))
  # end
  #
  # def self.wikis
  #   Wiki.where( id: pluck(:wiki_id))
  # end
  #
  # def wiki
  #   Wiki.find(wiki_id)
  # end
  #
  # def user
  #   User.find(user_id)
  # end
end