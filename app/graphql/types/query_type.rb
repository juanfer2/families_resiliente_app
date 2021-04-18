module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    #include GraphQL::Types::Relay::HasNodeField
    #include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :healt, String, null: false,
      description: "An example field added by the generator"
    def healt
      "OK"
    end

    field :professionals, [Types::ProfessionalType], null: true,
      description: 'Get professionals'
    def professionals
      Professional.all
    end

    field :family_documents, [Types::FamilyDocumentType], null: true, 
      description: 'Get professionals'
    def family_documents
      FamilyDocument.all
    end
  end
end
