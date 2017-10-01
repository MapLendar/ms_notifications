class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /notifications
  def index
    @notifications = Notification.all
    render json: @notifications
  end

  # GET /notifications/by_email
  def by_email
    if !params.has_key?( :email )
		    render json: { error: 'No email provided' }, status: 400
			return
		end

    puts params[:email].to_s
    @notification = Notification.where( email: params[:email])
    if @notification == nil
      render json: { error: 'notification not found' }, status: 400
    else
      render json: @notification, status: 200
    end
  end

  # POST /notifications
  def create
      @not = Notification.new(notification_params)

      if @not.save
        render json: @not, status: :created, location: @notification
      else
        render json: @not.errors, status: :unprocessable_entity
      end
    
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      #params.require(:notification).permit(:event_name, :event_date, :email, :event_time)
    params.permit(:event_name, :event_date, :email, :event_time)
  
    end
end
