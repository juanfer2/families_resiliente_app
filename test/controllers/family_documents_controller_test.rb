require "test_helper"

class FamilyDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_document = family_documents(:one)
  end

  test "should get index" do
    get family_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_family_document_url
    assert_response :success
  end

  test "should create family_document" do
    assert_difference('FamilyDocument.count') do
      post family_documents_url, params: { family_document: { code: @family_document.code, professional_id: @family_document.professional_id } }
    end

    assert_redirected_to family_document_url(FamilyDocument.last)
  end

  test "should show family_document" do
    get family_document_url(@family_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_document_url(@family_document)
    assert_response :success
  end

  test "should update family_document" do
    patch family_document_url(@family_document), params: { family_document: { code: @family_document.code, professional_id: @family_document.professional_id } }
    assert_redirected_to family_document_url(@family_document)
  end

  test "should destroy family_document" do
    assert_difference('FamilyDocument.count', -1) do
      delete family_document_url(@family_document)
    end

    assert_redirected_to family_documents_url
  end
end
