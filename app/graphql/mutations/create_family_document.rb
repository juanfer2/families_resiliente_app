module Mutations
  class CreateFamilyDocument < BaseMutation
    argument :family_document_attributes, Types::FamilyDocumentAttributesInput, required: true, description: 'Send emails to partner contact'
    type Types::SuccessfulMutationType

    def resolve(family_document_attributes:)
      FamilyDocuments::CreateFamilyDocumentService.new(family_document_attributes: family_document_attributes.to_h).call

      OpenStruct.new(success: true)
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
end
