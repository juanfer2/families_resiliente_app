module Mutations
  class CreateUser < BaseMutation
    argument :user_attributes, Types::UserAttributesInput, required: true, description: 'Send emails to partner contact'
    type Types::SuccessfulMutationType

    def resolve(user_attributes:)
      Users::CreateUserService.new(user_attributes: user_attributes.to_h).call

      OpenStruct.new(success: true)
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
end
