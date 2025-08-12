require "test_helper"

class DocumentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documento = documentos(:one)
  end

  test "should get index" do
    get documentos_url
    assert_response :success
  end

  test "should get new" do
    get new_documento_url
    assert_response :success
  end

  test "should create documento" do
    assert_difference("Documento.count") do
      post documentos_url, params: { documento: { area_id_id: @documento.area_id_id, fecha_conclucion: @documento.fecha_conclucion, fecha_disp: @documento.fecha_disp, fecha_recepcion: @documento.fecha_recepcion, no_libro: @documento.no_libro, no_memo: @documento.no_memo, no_notaria: @documento.no_notaria, no_oficio_de_conclucion: @documento.no_oficio_de_conclucion, nombre: @documento.nombre, notario: @documento.notario, observaciones: @documento.observaciones } }
    end

    assert_redirected_to documento_url(Documento.last)
  end

  test "should show documento" do
    get documento_url(@documento)
    assert_response :success
  end

  test "should get edit" do
    get edit_documento_url(@documento)
    assert_response :success
  end

  test "should update documento" do
    patch documento_url(@documento), params: { documento: { area_id_id: @documento.area_id_id, fecha_conclucion: @documento.fecha_conclucion, fecha_disp: @documento.fecha_disp, fecha_recepcion: @documento.fecha_recepcion, no_libro: @documento.no_libro, no_memo: @documento.no_memo, no_notaria: @documento.no_notaria, no_oficio_de_conclucion: @documento.no_oficio_de_conclucion, nombre: @documento.nombre, notario: @documento.notario, observaciones: @documento.observaciones } }
    assert_redirected_to documento_url(@documento)
  end

  test "should destroy documento" do
    assert_difference("Documento.count", -1) do
      delete documento_url(@documento)
    end

    assert_redirected_to documentos_url
  end
end
