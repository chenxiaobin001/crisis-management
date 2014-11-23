require 'test_helper'

class GroupDocsControllerTest < ActionController::TestCase
  setup do
    @group_doc = group_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_doc" do
    assert_difference('GroupDoc.count') do
      post :create, group_doc: { document_id: @group_doc.document_id, group_id: @group_doc.group_id }
    end

    assert_redirected_to group_doc_path(assigns(:group_doc))
  end

  test "should show group_doc" do
    get :show, id: @group_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_doc
    assert_response :success
  end

  test "should update group_doc" do
    patch :update, id: @group_doc, group_doc: { document_id: @group_doc.document_id, group_id: @group_doc.group_id }
    assert_redirected_to group_doc_path(assigns(:group_doc))
  end

  test "should destroy group_doc" do
    assert_difference('GroupDoc.count', -1) do
      delete :destroy, id: @group_doc
    end

    assert_redirected_to group_docs_path
  end
end
