class TtmakingController < ApplicationController
    def create
        
        Ttmaking.create(post_id: params[:post_id], tt_name: params[:tt_name],tt_date: params[:tt_date],tt_start: params[:tt_start],tt_fin: params[:tt_fin])
    end
    def destroy
        @ttmaking=Ttmaking.find(params[:ttmaking_id])
        @ttmaking.destroy
        
        redirect_to"/post/time/#{params[:post_id]}"
    end
end
