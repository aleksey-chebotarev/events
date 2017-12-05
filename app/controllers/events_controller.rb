class EventsController < ApplicationController
  before_action :region_is_valid!
  before_action :load_event, only: :show

  PER_PAGE = 10

  def index
    @events = Event.recent
                .filter(params.slice(:start_event, :by_organizer, :by_place, :by_upcoming))
                .page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  private

  def load_event
    @event ||= Event.find(params[:id]).decorate
  end
end
