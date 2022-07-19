module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user!, only: %i[create destroy]
      before_action :set_product, only: %i[destroy]

      def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.build(body: comment_params[:body], user: current_user)
        
        if @comment.save
          render json: @comment
        else
          render json:{ errors: @comment.errors.messages }
        end
      end
      
      def destroy
        comment = current_user.comments.find(params[:id])
        
        if comment.destroy
          render json: comment
        else
          render json: { errors: comment.errors.messages }, status: :unprocessable_entity
        end
      end
    
      private

      def comment_params
        params.require(:comment).permit(%i[body])
      end
      
      def set_product
        @comment = Comment.find(params[:id])
      end
    end
  end
end
