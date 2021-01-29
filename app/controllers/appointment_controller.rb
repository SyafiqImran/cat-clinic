class AppointmentController < ApplicationController
    def index
        @appointments = Appointment.all
    end

    def create
        appointment = Appointment.new(
            date: params[:date],
            time: params[:time]
        )
        appointment.save
        if appointment.save
          # Deliver the signup email
          subject = 'Here is the date and time of your appointment'
          body = 
          "
            Here is your appointment detail :
              Date : '#{appointment.date}'
              Time : '#{appointment.time}'
    
            Hope to see you soon at the clinic.
            Have a good day! 
          "
    
          EmailService.send(current_user.email, subject, body)
          # redirect_to(@user, :notice => 'User created')
          puts 'hehehehehehe'
          redirect_to '/welcome'
        else
          render :action => 'new'
        end
    end
end 