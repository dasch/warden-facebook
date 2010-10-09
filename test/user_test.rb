require 'helper'

class UserTest < Test::Unit::TestCase
  context "A user" do
    setup do
      data = {"first_name" => "John",
              "last_name"  => "Doe",
              "name"       => "John Doe",
              "email"      => "john.doe@example.com"}

      @user = Warden::Facebook::User.new(data, "1234")
    end

    should "have a first_name" do
      assert_equal "John", @user.first_name
    end

    should "have a last_name" do
      assert_equal "Doe", @user.last_name
    end

    should "have a name" do
      assert_equal "John Doe", @user.name
    end

    should "have an email" do
      assert_equal "john.doe@example.com", @user.email
    end
  end
end
