class OrganizersController < ApplicationController
  before_action :region_is_valid!

  PER_PAGE = 10

  def index
    @organizers = Organizer.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def show
    @events = organizer.events.recent.decorate
  end

  private

  def organizer
    @organizer ||= Organizer.find(params[:id])
  end
  helper_method :organizer
end
