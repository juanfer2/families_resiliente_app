module Types
  class FamilyDocumentAttributesInput < Types::BaseInputObject
    argument :code, String, required: true
    argument :professional_id, Int, required: true
    argument :document, [ApolloUploadServer::Upload], required: false
  end
end
