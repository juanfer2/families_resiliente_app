module Types
  class SuccessfulMutationType < Types::BaseObject
    field :success, Boolean, null: false, description: "True if the process went well"
  end
end
