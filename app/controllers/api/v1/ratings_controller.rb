module Api
  module V1
    class RatingsController < ApplicationController
      before_action :authenticate_user!, only: %i[create destroy]
      before_action :set_rating, only: %i[destroy]
       
      def create
        @recipe = Recipe.find(params[:recipe_id])
        @rating = @recipe.ratings.build(rating: rating_params[:rating], user: current_user)
        
        if @rating.save
          render json: @rating
        else
          render json:{ errors: @rating.errors.messages }
        end
      end
      
      def destroy
        rating = current_user.ratings.find(params[:id])
        
        if rating.destroy
          render json: rating
        else
          render json: { errors: rating.errors.messages }, status: :unprocessable_entity
        end
      end
    
      private

      def rating_params
        params.require(:rating).permit(%i[rating])
      end
      
      def set_rating
        @rating = Rating.find(params[:id])
      end
    
    end
  end
end
