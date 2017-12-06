class EventsController < ApplicationController
  before_action :region_is_valid!
  before_action :load_event, only: :show

  PER_PAGE = 10

  def index
    @events = region.events.recent
                    .filter(params.slice(:start_event, :by_organizer, :by_place, :by_upcoming))
                    .page(params[:page]).per(params[:per_page] || PER_PAGE).decorate
  end

  def show
    respond_to do |format|
      format.html
      format.ics do
        send_data ics_build.start, filename: ics_build.filename
      end
    end
  end

  private

  def ics_build
    IcsService.new(@event)
  end

  def region
    @region ||= Region.find_by(number: cookies[:region_number])
  end

  def load_event
    @event ||= region.events.find(params[:id]).decorate
  end
end
