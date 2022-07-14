module Api
  module V1
    class CommentsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   
      def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.build(comment_params)
        
        if @comment.save
          render json: @comment
        else
          render json:{ errors: @comment.errors.messages }
        end
      end
    
      private

      def comment_params
        params.require(:comment).permit(%i[author body])
      end
      
      def record_not_found
        render json: { errors: "recipe not found" }
      end
    end
  end
end
