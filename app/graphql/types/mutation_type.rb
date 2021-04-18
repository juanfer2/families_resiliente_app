module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_user, SuccessfulMutationType, null: true, mutation: Mutations::CreateUser
    field :create_professional, SuccessfulMutationType, null: true, mutation: Mutations::CreateProfessional
    field :create_family_document, SuccessfulMutationType, null: true, mutation: Mutations::CreateFamilyDocument
  end
end
