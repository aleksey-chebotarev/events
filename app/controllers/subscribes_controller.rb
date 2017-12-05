class SubscribesController < ApplicationController
  def create
    subscribe = Subscribe.new(email: params[:email])

    if subscribe.save
      flash[:success] = 'Вы подписаны на рассылку'
    else
      flash[:error] = subscribe.errors['email'].join(', ')
    end

    redirect_to root_path
  end
end
