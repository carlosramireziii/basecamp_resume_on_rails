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
    Project.destroy_all

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

  test 'should get show' do
    uploaded_file = @project.uploaded_files.first

    get project_path(@project)

    assert_response :success
    assert_select 'h1', text: @project.title
    assert_select 'h2', text: 'Posts'
    assert_select 'h2', text: 'To-dos'
    assert_select 'h2', text: 'Docs & Files'
    assert_select 'h3', text: uploaded_file.filename.to_s
  end

  test 'should get edit' do
    get edit_project_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Edit project details'
    assert_select 'form'
  end

  test 'should patch update' do
    patch project_path(@project), params: { project: { title: 'New title' } }

    assert_response :redirect
    assert_redirected_to project_path(@project)
    assert_not_nil flash.notice
    assert_equal 'New title', @project.reload.title
  end

  test 'should delete destroy' do
    assert_changes 'Project.count' do
      delete project_path(@project)
    end

    assert_response :redirect
    assert_redirected_to projects_path
    assert_not_nil flash.alert
  end
end
