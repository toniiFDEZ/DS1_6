class UsersController < ApplicationController
   def new
      @user = User.new
      @user.name='manue'
   end

   def create
      @user =User.create(name: params[:user][:name])
      render json: @user
   end

end
