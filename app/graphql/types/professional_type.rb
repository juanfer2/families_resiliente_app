module Types
  class ProfessionalType < Types::BaseObject
    field :id, ID, null: false, description: "The professional's id"#, deprecation_reason: 'Use token field instead of it'
    field :name, String, null: false, description: "The professional's name"
  end
end
