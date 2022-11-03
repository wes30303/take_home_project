class Api::V1::SubscriptionController < ApplicationController
  def index
    subscription = Subscription.all
    render json: subscription, status: 201
  end

  def create
    subscription = Subscription.new(customer_id: params[:customer],
                                  tea_id: params[:tea],
                                  title: params[:title],
                                  price: params[:price],
                                  status: "True",
                                  frequency: params[:frequency])
    if subscription.save
      render json: subscription, status: 201
    else
      render json: { description: 'Error: Incorrect parameters' }, status: 401
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:id])
    if subscription[:status] == "True"
      subscription.update_attributes(status: "False")
      render json: subscription, status: 201
    else
      render json: { description: 'Subscription Is Already Canceled' }, status: 401
    end
  end

  private
  def user_game_params
    params.permit(:customer, :tea, :title, :price, :frequency)
  end
end
