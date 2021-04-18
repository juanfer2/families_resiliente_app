module Mutations
  class CreateProfessional < BaseMutation
    argument :professional_attributes, Types::ProfessionalAttributesInput, required: true, description: 'Send emails to partner contact'
    type Types::SuccessfulMutationType

    def resolve(professional_attributes:)
      Professionals::CreateProfessionalService.new(professional_attributes: professional_attributes.to_h).call

      OpenStruct.new(success: true)
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
end
