class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def  create
      user_params = params.require(:user).permit([:first_name,
                                                  :last_name,
                                                  :email,
                                                  :password,
                                                  :password_confirmation])
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to ideas_path, alert: 'Thank you for signing up'
      else
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
      # @idea = Idea.find(params[:id])
    end

end
