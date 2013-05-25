require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should enter a hotel name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:hotel_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:roman).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have profile name with out spaces" do
  	user = User.new
  	user.profile_name = "My Profile name with spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formated correctly.")
  end
end
