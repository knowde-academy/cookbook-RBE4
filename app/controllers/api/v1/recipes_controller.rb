module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, except: %i[create index]
      before_action :set_product, only: %i[add_product delete_product]
      
      def index
        render json: { data: ActiveModel::SerializableResource.new(Recipe.all, each_serializer: RecipeSerializer) }
      end

      def show
        render json: RecipeSerializer.new(@recipe).to_h
      end

      def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          render json: @recipe
        else
          render json: { errors: @recipe.errors.messages }, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: @recipe
        else
          render json: { errors: @recipe.errors.messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @recipe.destroy
          render json: @recipe
        else
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end
      
      def add_product
        product_recipe = ProductRecipe.new(
          quantity: product_params[:quantity], 
          product: @product, 
          recipe: @recipe
        )
        
        if product_recipe.save
          render json: product_recipe
        else
          render json: { errors: product_recipe.errors.messages }, status: :unprocessable_entity
        end
      end
      
      def delete_product
        product_recipe = @recipe.product_recipes.find_by!(product_id: @product.id)
        
        if product_recipe.destroy
          render json: product_recipe
        else
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end

      private

      def recipe_params
        params.require(:recipe).permit(%i[name content level price time video_link])
      end
      
      def product_params
        params.require(:product).permit(%i[quantity])
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
      
      def set_product
        @product = Product.find(params[:product_id])
      end
    end
  end
end
