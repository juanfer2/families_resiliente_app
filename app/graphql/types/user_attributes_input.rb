module Types
  class UserAttributesInput < Types::BaseInputObject
    argument :name, String, required: true
  end
end
