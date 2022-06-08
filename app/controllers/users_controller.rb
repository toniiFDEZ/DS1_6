class UsersController < ApplicationController
   def new
      @user = User.new
      @user.name='manue'
   end

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         redirect_to root_url, notice: 'User successfully created.'
      else
         render :new
      end
   end

end
