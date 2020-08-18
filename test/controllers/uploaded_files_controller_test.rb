require 'test_helper'

class UploadedFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:my_project)
    @uploaded_file = uploaded_files(:resume)
  end

  test 'should get index' do
    get project_uploaded_files_path(@project)

    assert_response :success
    assert_select 'a', text: @project.title
    assert_select 'h1', text: 'Docs & Files'
    assert_select 'h2', text: @uploaded_file.filename.to_s
  end

  test 'should get index when there are no uploaded files' do
    UploadedFile.delete_all

    get project_uploaded_files_path(@project)

    assert_response :success
    assert_select 'a', text: 'Upload your first file now'
  end

  test 'should get new' do
    get new_project_uploaded_file_path(@project)

    assert_response :success
    assert_select 'h1', text: 'Upload a new file'
    assert_select 'form'
  end

  test 'should post create' do
    assert_changes 'UploadedFile.count' do
      sign_in users(:carlos)
      post project_uploaded_files_path(@project), params: { uploaded_file: new_uploaded_file_params }
    end

    assert_response :redirect
    assert_redirected_to project_uploaded_files_path(@project)
    assert_not_nil flash.notice
  end

  test 'should get show' do
    get project_uploaded_file_path(@project, @uploaded_file)

    assert_response :success
    assert_select 'h1', text: @uploaded_file.filename.to_s
    assert_select 'a', text: 'Download'
  end

  test 'should delete destroy' do
    assert_changes 'UploadedFile.count' do
      delete project_uploaded_file_path(@project, @uploaded_file)
    end

    assert_response :redirect
    assert_redirected_to project_uploaded_files_path
    assert_not_nil flash.alert
  end

  private

  def new_uploaded_file_params
    { file: { io: file_fixture('resume.txt'), content_type: 'text/plain', filename: 'resume.txt' } }
  end
end
