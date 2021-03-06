class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save {self.role ||= :standard}

  has_many :wikis
  has_many :charges
  has_many :collaborators

   def show
     @user = User.find(params[:id]) if params[:id].present?
     unless @user
       @user = current_user
     end
   end

  #  def collaborators
  #    Collaborator.where(user_id: id)
  #  end

enum role: [:standard, :premium, :admin]

end
