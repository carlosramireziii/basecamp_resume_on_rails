require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:carlos)
    @project = projects(:my_project)
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
    sign_in @user
    get new_project_path

    assert_response :success
    assert_select 'h1', text: 'Create new project'
    assert_select 'form'
  end

  test 'should not get new when signed out' do
    assert_requires_registration do
      get new_project_path
    end
  end

  test 'should post create' do
    assert_changes 'Project.count' do
      sign_in @user
      post projects_path, params: { project: { title: 'New project', description: 'Testing create' } }
    end

    assert_response :redirect
    assert_redirected_to projects_path
  end

  test 'should not post create when signed out' do
    assert_requires_registration do
      post projects_path
    end
  end

  test 'should get show' do
    uploaded_file = @project.uploaded_files.first
    message = @project.messages.first
    todo_list = @project.todo_lists.first

    get project_path(@project)

    assert_response :success
    assert_select 'h1', text: @project.title
    assert_select 'h2', text: 'Message Board'
    assert_select 'h2', text: 'To-dos'
    assert_select 'h2', text: 'Docs & Files'
    assert_select 'h3', text: uploaded_file.filename.to_s
    assert_select 'h3', text: message.title
    assert_select 'h3', text: todo_list.title
  end

  test 'should get edit' do
    sign_in @user
    get edit_project_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Edit project details'
    assert_select 'form'
  end

  test 'should not get edit when signed out' do
    assert_requires_registration do
      get edit_project_path(@project)
    end
  end

  test 'should patch update' do
    sign_in @user
    patch project_path(@project), params: { project: { title: 'New title' } }

    assert_response :redirect
    assert_redirected_to project_path(@project)
    assert_equal 'New title', @project.reload.title
  end

  test 'should not patch update when signed out' do
    assert_requires_registration do
      patch project_path(@project)
    end
  end

  test 'should delete destroy' do
    assert_changes 'Project.count' do
      sign_in @user
      delete project_path(@project)
    end

    assert_response :redirect
    assert_redirected_to projects_path
  end

  test 'should not delete destroy when signed out' do
    assert_requires_registration do
      delete project_path(@project)
    end
  end
end
