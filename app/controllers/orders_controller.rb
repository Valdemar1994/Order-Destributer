class OrdersController < BaseController

  def new
    @order = current_user.orders.build
    @area = ["Камыши", "Остряки", "Центр/Стрелка", "Северная"]
  end

  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      redirect_to new_order_path, status: :unprocessable_entity
    end
  end

  private 

  def order_params
    params.require(:order).permit(:number, :phone, :area, :adress, :delivery_time_start,
      :delivery_time_end, :description, :comment, :creator_id, :delivery_person_id, :state)
  end
end
