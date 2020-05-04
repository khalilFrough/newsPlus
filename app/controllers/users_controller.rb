class UsersController < ApplicationController
    
  
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    def show
    
    end 
  
    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
        #   cookies.signed[:user_id] = @user.id
          format.html { redirect_to @user, notice: 'User was successfully created.' }
        #   format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    
  
    def my_profile
      @user = current_user
      @blogs = current_user.blogs
      @comments = current_user.comments
    end
  
    def settings
      @user = current_user
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :email, :mobile, :city, :personal_information, :avater, :password,:password_confirmation, :type_of_card, :card_number, :id_card)
      end
  end