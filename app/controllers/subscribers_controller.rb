class SubscribersController < ApplicationController
  def create
    subscribe = Subscriber.new(email: params[:email])

    if subscribe.save
      flash[:success] = 'Вы подписаны на рассылку'
    else
      flash[:error] = subscribe.errors['email'].join(', ')
    end

    redirect_to root_path
  end
end
