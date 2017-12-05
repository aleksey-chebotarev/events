class EventsController < ApplicationController
  before_action :region_is_valid!
  before_action :load_event, only: :show

  PER_PAGE = 10

  def index
    @events = region.events.recent
                    .filter(params.slice(:start_event, :by_organizer, :by_place, :by_upcoming))
                    .page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  private

  def region
    @region ||= Region.find_by(number: cookies[:region_number] || params[:region_number])
  end

  def load_event
    @event ||= region.events.find(params[:id]).decorate
  end
end
