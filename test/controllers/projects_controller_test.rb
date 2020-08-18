require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:my_project)
    sign_in users(:carlos)
  end

  test 'should get index' do
    get projects_path

    assert_response :success
    assert_select 'h1', text: 'Projects'
    assert_select 'h2', text: @project.title
  end

  test 'should get index with no projects' do
    Project.delete_all

    get projects_path

    assert_response :success
    assert_select 'a', text: 'Create your first project'
  end

  test 'should get new' do
    get new_project_path

    assert_response :success
    assert_select 'h1', text: 'Create new project'
    assert_select 'form'
  end

  test 'should post create' do
    assert_changes 'Project.count' do
      post projects_path, params: { project: { title: 'New project', description: 'Testing create' } }
    end

    assert_response :redirect
    assert_redirected_to projects_path
  end
end
