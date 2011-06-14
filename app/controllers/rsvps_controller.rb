class RsvpsController < ApplicationController
  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rsvps }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.json
  def new
    @rsvp = Rsvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rsvp }
    end
  end
  
  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :ok }
    end
  end
end