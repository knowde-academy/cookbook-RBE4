module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, except: %i[create index]
      
      def index
        render json: { data: ActiveModel::SerializableResource.new(Product.all, each_serializer: ProductSerializer) }
      end

      def show
        render json: ProductSerializer.new(@product).to_h
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: { errors: @product.errors.messages }, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: { errors: @product.errors.messages }, status: :unprocessable_entity
        end
      end
      
      def destroy
        if @product.destroy
          render json: @product
        else
          render json: { errors: @product.errors.messages }, status: :unprocessable_entity
        end
      end

      private
      
      def product_params
        params.require(:product).permit(%i[name])
      end

      def set_product
        @product = Product.find(params[:id])
      end
    end      
  end
end
