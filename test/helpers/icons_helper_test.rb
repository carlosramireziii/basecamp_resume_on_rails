class IconsHelperTest < ActionView::TestCase
  test 'should return the correct icon class' do
    assert_dom_equal %{<i class="fas fa-user"></i>}, icon('user')
  end

  test 'should return additional classes' do
    assert_dom_equal %{<i class="fas fa-user ml-1"></i>}, icon('user', class: 'ml-1')
  end

  test 'should include text when provided' do
    assert_dom_equal %{<i class="fas fa-user mr-1"></i>My Text}, icon('user', text: 'My Text')
  end

  test 'should return icon based on content type' do
    assert_equal 'file-alt', icon_for_content_type('text/plain')
    assert_equal 'file-video', icon_for_content_type('video/mp4')
    assert_equal 'file-audio', icon_for_content_type('audio/mp3')
    assert_equal 'file-pdf', icon_for_content_type('application/pdf')
    assert_equal 'file', icon_for_content_type('custom/type')
  end
end
