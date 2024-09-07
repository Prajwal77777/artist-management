module Api
  module V1
    class UsersController < ApplicationController
      # GET /api/v1/users
      def index
        sql = 'SELECT * FROM users'
        @users = ActiveRecord::Base.connection.execute(sql)
        render json: @users, status: :ok, code: 200
      end

      def create
        sql = 'INSERT INTO users (first_name, last_name, email, phone,password_digest,role,gender) VALUES $1,$2,$3,$4,$5,$6,$7)'
        ActiveRecord::Base.connection.execute(sql, params[:first_name], params[:last_name], params[:email], params[:phone], BCrypt::Password.create(params[:password_digest]),
                                              params[:role], params[:gender])
        render json: @users
      end
    end
  end
end
