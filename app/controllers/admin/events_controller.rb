class Admin::EventsController < Admin::BaseController
  before_action :load_event, only: [:show, :edit, :update]

  PER_PAGE = 10

  def index
    @events = Event.recent
                   .page(params[:page]).per(params[:per_page] || PER_PAGE).decorate
  end

  def new
    @event = Event.new
    @event.build_place
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      flash[:success] = 'Мероприятие успешно создано.'
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def update
    if request.xhr?
      @cities = Region.find(params[:id]).cities
    else
      if @event.update(event_params)
        flash[:success] = 'Мероприятие успешно изменено.'

        redirect_to admin_events_path
      else
        render :edit
      end
    end
  end

  private

  def load_event
    @event ||= Event.find(params[:id]).decorate
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :cover, :external_link,
                                  :region_id, :city_id, :organizer_id,
                                  place_attributes: %i[id title address]
    )
  end
end
