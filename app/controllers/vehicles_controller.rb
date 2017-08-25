class VehiclesController < ApplicationController
	def index
		@vehicles = Vehicle.page(params[:page])
	end

	def show
		@vehicle = Vehicle.find(params[:id])
	end

	def new
		@vehicle = Vehicle.new 
	end

	def edit
		@vehicle = Vehicle.find(params[:id])
	end

	def update
		@vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_param)
			flash[:notice] = "O veículo #{@vehicle.model.upcase} foi atualizado com sucesso."
			redirect_to vehicles_path
		else
			flash.now[:alert] = "O veículo #{@vehicle.model.upcase} não pode ser atualizado."
			render vehicles_path
		end
	end

	def destroy
		@vehicle = Vehicle.find(params[:id])
		@vehicle.destroy

		if @vehicle.destroyed?
			flash[:notice] = "O veículo #{@vehicle.model.upcase} foi deletado com sucesso."
			redirect_to vehicles_path
		else
			flash.now[:alert] = "O veículo #{@vehicle.model.upcase} não pode ser deletado."
			render vehicles_path
		end
	end

	def create
		@vehicle = Vehicle.new(vehicle_param)
    if @vehicle.save
    	flash[:notice] = "O veículo #{@vehicle.model.upcase} foi adicionado com sucesso."
      redirect_to @vehicle
    else
      render 'new'
    end
	end

	private
		def vehicle_param
			params.require(:vehicle).permit(:license_plate, :brand, :model, :year, :chassi, :renavam, :color, :doors_number)
		end
end
