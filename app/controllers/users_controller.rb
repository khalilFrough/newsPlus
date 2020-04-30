class UsersController < ApplicationController 
    # creating a new user
    def new 
        @user= User.new
    end 
    # new action is updated by the create action
    def create
        @user= User.new(user_params)
        if @user.save
            # do somehting 
            format.html { redirect_to @user, notice: 'user was successfuly created'}
        else 
            # do somthing else
            format.html{ render :new }
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :mobile, :city, :personal_information, :avater, password, :password_confirmation, :type_of_card, :card_number, :id_card)
    end 
end 