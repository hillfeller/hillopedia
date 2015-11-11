class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def show
     @user = User.find(params[:id]) if params[:id].present?
     unless @user
       @user = current_user
     end
   end

   def after_initialize
      return unless new_record?
      self.status = ACTIVE
   end
end
