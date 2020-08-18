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
end
