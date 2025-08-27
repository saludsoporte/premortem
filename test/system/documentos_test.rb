require "application_system_test_case"

class DocumentosTest < ApplicationSystemTestCase
  setup do
    @documento = documentos(:one)
  end

  test "visiting the index" do
    visit documentos_url
    assert_selector "h1", text: "Documentos"
  end

  test "should create documento" do
    visit documentos_url
    click_on "New documento"

    fill_in "Area id", with: @documento.area_id
    fill_in "Fecha conclucion", with: @documento.fecha_conclucion
    fill_in "Fecha disp", with: @documento.fecha_disp
    fill_in "Fecha recepcion", with: @documento.fecha_recepcion
    fill_in "No libro", with: @documento.no_libro
    fill_in "No memo", with: @documento.no_memo
    fill_in "No notaria", with: @documento.no_notaria
    fill_in "No oficio de conclucion", with: @documento.no_oficio_de_conclucion
    fill_in "Nombre", with: @documento.nombre
    fill_in "Notario", with: @documento.notario
    fill_in "Observaciones", with: @documento.observaciones
    click_on "Create Documento"

    assert_text "Documento was successfully created"
    click_on "Back"
  end

  test "should update Documento" do
    visit documento_url(@documento)
    click_on "Edit this documento", match: :first

    fill_in "Area id", with: @documento.area_id
    fill_in "Fecha conclucion", with: @documento.fecha_conclucion
    fill_in "Fecha disp", with: @documento.fecha_disp
    fill_in "Fecha recepcion", with: @documento.fecha_recepcion
    fill_in "No libro", with: @documento.no_libro
    fill_in "No memo", with: @documento.no_memo
    fill_in "No notaria", with: @documento.no_notaria
    fill_in "No oficio de conclucion", with: @documento.no_oficio_de_conclucion
    fill_in "Nombre", with: @documento.nombre
    fill_in "Notario", with: @documento.notario
    fill_in "Observaciones", with: @documento.observaciones
    click_on "Update Documento"

    assert_text "Documento was successfully updated"
    click_on "Back"
  end

  test "should destroy Documento" do
    visit documento_url(@documento)
    click_on "Destroy this documento", match: :first

    assert_text "Documento was successfully destroyed"
  end
end
