class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name]
    render json: cheeses, except: [:id, :name], methods: [:summary]
    
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    # error message
    if cheese
      render json: cheese
    else
      render json: {error: "cheese not found"}, status: 404
    end
  end

end
