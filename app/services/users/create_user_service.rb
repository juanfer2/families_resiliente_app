module Users
  class CreateUserService < ApplicationService
    attr_reader :user_attributes

    def initialize(user_attributes:)
      @user_attributes = user_attributes
    end

    def call
      create
    end

    private

    def create
      User.create!(user_attributes)
    end
  end
end
