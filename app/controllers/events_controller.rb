class EventsController < ApplicationController

  def index
    if is_number(params[:issue]) && exists(params[:issue])
      events = Event.select(:action, :create_by, :created_at)
                    .where("number = ?", params[:issue])
                    .as_json(:except => :id)

      render json: events
    else
      render json: params[:issue]
    end
  end

  def create
    event_params = JSON.parse(request.body.read)

    if event_params["action"]
      Event.create(
        :action => event_params["action"],
        :number => event_params["issue"]["number"],
        :create_by => event_params["issue"]["user"]["login"]
      )
    end

    render json: event_params
  end

  private

  def exists(value)
    Event.where('number = ?', value).any?
  end

  def is_number(str)
    !!(Float(str) rescue false)
  end

end