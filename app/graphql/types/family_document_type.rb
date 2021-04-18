module Types
  class FamilyDocumentType < Types::BaseObject
    field :id, ID, null: false, description: "The reservation's id", deprecation_reason: 'Use token field instead of it'
    field :code, String, null: false, description: "The reservation's id"
    #field :professional, [Types::ProfessionalType], null: false, description: "The reservation's id"
    
    #def document_url
    #  url_helpers.rails_blob_url(object.image, host: request_host)
    #end
  end
end
