class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @adress = Adress.new
  end

  def edit
  end

  def show
    @img = Image.find(Image.ids.sample)
  end

  def create
    @adress = Adress.new(adress_params)
    @user = User.new(user_params)
    @user.adress = @adress

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @user.adress.nil?
      @adress = Adress.new(adress_params)
      @user.adress = @adress
    else
      @adress = @user.adress
      @adress.update(adress_params)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.adress.destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :age,
                                 :sex,
                                 :about,
                                 adress_atributes: [:city,
                                                    :street,
                                                    :home_number,
                                                    :zip
                                                   ]
                                )
  end

  def adress_params
    params.require(:adress).permit(:city,
                                   :street,
                                   :home_number,
                                   :zip
                                  )
  end

end