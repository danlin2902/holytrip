class ParticipantsController < ApplicationController

  def new
    @trip = Trip.find(params[:id])
    @participant = Participant.new
  end

  def create
    @participant.trip = Trip.find(params[:trip_id])
    @participant.user = User.find(params[:user_id])
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:status)
  end
end
