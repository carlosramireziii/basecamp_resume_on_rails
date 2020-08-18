class Guest
  def first_name
    'Guest'
  end

  def last_name
    'User'
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
