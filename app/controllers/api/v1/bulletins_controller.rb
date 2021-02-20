class Api::V1::BulletinsController < ApplicationController

     def index 
        bulletins = BUlletin.all 
        render json:  bulletins
      end 
  
      def create 
        bulletin = Bulletin.new(bulletin_params)
  
        if account.save
          render json: bulletin
        else 
          render json: {message: 'Bulletin data not found' }
        end
      end 
  
      def show 
        bulletin = Bulletin.find(params[:id])
        render json: bulletin
      end 
  
      def destroy 
        bulletin = Board.find(params[:id]) 
        bulletin.destroy
      end 
  
      private 
  
      def bulletin_params 
        params.require(:bulletin).permit(:title, :content, :board_id)
      end
  

end
