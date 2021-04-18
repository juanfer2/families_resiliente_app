module FamilyDocuments
  class CreateFamilyDocumentService < ApplicationService
    attr_reader :family_document_attributes, :document

    def initialize(family_document_attributes:)
      @family_document_attributes = family_document_attributes
      @document = family_document_attributes[:document]
    end

    def call
      create
    end

    private

    def create
      family_document = FamilyDocument.new(family_document_attributes.except(:document))
      
      if document
        family_document.document.attach(io: File.open(document.path), filename: document.original_filename,
          content_type: document.content_type)
      end

      family_document.save!
    end
  end
end
