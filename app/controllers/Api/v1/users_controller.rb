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
        sql = 'INSERT INTO users (first_name, last_name, email, phone, password_digest, role, gender,created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)'

        sanitized_sql = ActiveRecord::Base.send(:sanitize_sql_array, [
                                                  sql,
                                                  params[:first_name],
                                                  params[:last_name],
                                                  params[:email],
                                                  params[:phone],
                                                  BCrypt::Password.create(params[:password_digest]),
                                                  params[:role],
                                                  params[:gender]
                                                ])

        ActiveRecord::Base.connection.exec_query(sanitized_sql)
        render json: [], status: :created, code: 201
      end

      def update
        sql = 'UPDATE users SET first_name = ?, last_name = ?, email = ?, phone = ?, gender = ? WHERE id = ?'

        sanitized_sql = ActiveRecord::Base.send(:sanitize_sql_array, [
                                                  sql,
                                                  params[:first_name],
                                                  params[:last_name],
                                                  params[:email],
                                                  params[:phone],
                                                  params[:gender],
                                                  params[:id]
                                                ])
        ActiveRecord::Base.connection.exec_query(sanitized_sql)
        render json: [], status: :ok, code: 200
      end
    end
  end
end
