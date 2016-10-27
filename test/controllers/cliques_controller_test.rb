require 'test_helper'

class CliquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clique = cliques(:one)
  end

  test "should get index" do
    get cliques_url
    assert_response :success
  end

  test "should get new" do
    get new_clique_url
    assert_response :success
  end

  test "should create clique" do
    assert_difference('Clique.count') do
      post cliques_url, params: { clique: { creator_id: @clique.creator_id, name: @clique.name } }
    end

    assert_redirected_to clique_url(Clique.last)
  end

  test "should show clique" do
    get clique_url(@clique)
    assert_response :success
  end

  test "should get edit" do
    get edit_clique_url(@clique)
    assert_response :success
  end

  test "should update clique" do
    patch clique_url(@clique), params: { clique: { creator_id: @clique.creator_id, name: @clique.name } }
    assert_redirected_to clique_url(@clique)
  end

  test "should destroy clique" do
    assert_difference('Clique.count', -1) do
      delete clique_url(@clique)
    end

    assert_redirected_to cliques_url
  end
end
