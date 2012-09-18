require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  setup do
    @program = programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post :create, program: { card_id: @program.card_id, end_period: @program.end_period, name: @program.name, reward_limit: @program.reward_limit, reward_rate: @program.reward_rate, start_period: @program.start_period }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  test "should show program" do
    get :show, id: @program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    put :update, id: @program, program: { card_id: @program.card_id, end_period: @program.end_period, name: @program.name, reward_limit: @program.reward_limit, reward_rate: @program.reward_rate, start_period: @program.start_period }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    assert_difference('Program.count', -1) do
      delete :destroy, id: @program
    end

    assert_redirected_to programs_path
  end
end
