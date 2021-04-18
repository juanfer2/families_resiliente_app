require "application_system_test_case"

class FamilyDocumentsTest < ApplicationSystemTestCase
  setup do
    @family_document = family_documents(:one)
  end

  test "visiting the index" do
    visit family_documents_url
    assert_selector "h1", text: "Family Documents"
  end

  test "creating a Family document" do
    visit family_documents_url
    click_on "New Family Document"

    fill_in "Code", with: @family_document.code
    fill_in "Professional", with: @family_document.professional_id
    click_on "Create Family document"

    assert_text "Family document was successfully created"
    click_on "Back"
  end

  test "updating a Family document" do
    visit family_documents_url
    click_on "Edit", match: :first

    fill_in "Code", with: @family_document.code
    fill_in "Professional", with: @family_document.professional_id
    click_on "Update Family document"

    assert_text "Family document was successfully updated"
    click_on "Back"
  end

  test "destroying a Family document" do
    visit family_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family document was successfully destroyed"
  end
end
