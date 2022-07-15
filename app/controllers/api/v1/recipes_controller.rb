module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, except: %i[create index]
      
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
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: @recipe
        else
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end

      def destroy
        if @recipe.destroy
          render json: @recipe
        else
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end
      
      def createproduct
        Product.find(params[:product_id])
        Recipe.find(params[:id])
        
        # Check if product arleady exists and return if present
        if ProductRecipe.find_by(recipe_id: params[:id], product_id: params[:product_id]).present?  
          render json: { errors: "Product arleady exists on recipe." }, status: :unprocessable_entity and return
        end
        
        product_recipe = ProductRecipe.new(product_params)
        product_recipe.update(product_id: params[:product_id], recipe_id: params[:id])
        
        if product_recipe.save
          render json: product_recipe
        else
          render json: { errors: product_recipe.errors.messages }, status: :unprocessable_entity
        end
      end
      
      def destroyproduct
        product_recipe = ProductRecipe.find_by(recipe_id: params[:id], product_id: params[:product_id])
        
        unless product_recipe.present?
          render json: { errors: "Product doesn't exists." }, status: :unprocessable_entity and return
        end
        
        if product_recipe.destroy
          render json: product_recipe
        else
          render json: { errors: @recipe.errors.to_s }, status: :unprocessable_entity
        end
      end

      private

      def recipe_params
        params.require(:recipe).permit(%i[name content level price])
      end
      
      def product_params
        params.require(:product).permit(%i[quantity])
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
    end
  end
end
