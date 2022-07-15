module Api
  module V1
    class RatingsController < ApplicationController
   
      def create
        @recipe = Recipe.find(params[:recipe_id])
        @rating = @recipe.ratings.build(rating_params)
        
        if @rating.save
          render json: @rating
        else
          render json:{ errors: @rating.errors.messages }
        end
      end
    
      private

      def rating_params
        params.require(:rating).permit(%i[author rating])
      end
    
    end
  end
end
