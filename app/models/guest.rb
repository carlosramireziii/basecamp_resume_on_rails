class Guest
  def avatar
    OpenStruct.new(attached?: false)
  end

  def first_name
    'Guest'
  end

  def last_name
    'User'
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def guest?
    true
  end
end
