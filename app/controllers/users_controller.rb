class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.create(params.require(:user).permit(:username,:email,:password))
    session[:user_id] = @user.id
    if @user.save
      # Deliver the signup email
      subject = 'Thank you for signing up with Vet Clinic'
      body = 
      "
        Here is your account detail :
          Username : '#{@user.username}'
          Password : '#{@user.password}'

        Hope to see you soon at the clinic.
      "

      EmailService.send(@user.email, subject, body)
      # redirect_to(@user, :notice => 'User created')
      puts 'hehehehehehe'
      redirect_to '/welcome'
    else
      render :action => 'new'
    end
    # redirect_to '/welcome'
  end
end
