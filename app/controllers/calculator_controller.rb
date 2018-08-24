class CalculatorController < ApplicationController
  def index
    Calculator.create(post_id: params[:post_id], bab: params[:bab],sul: params[:sul])
    redirect_to :back
  end
<<<<<<< HEAD
  
=======
  
end
>>>>>>> bdf852b9f83377dd83ef5288c4085bc140fa1639
