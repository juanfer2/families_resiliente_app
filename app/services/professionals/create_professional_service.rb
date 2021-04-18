module Professionals
  class CreateProfessionalService < ApplicationService
    attr_reader :professional_attributes

    def initialize(professional_attributes:)
      @professional_attributes = professional_attributes
    end

    def call
      create
    end

    private

    def create 
      Professional.create!(professional_attributes)
    end
  end
end
