require 'spec_helper'

describe "users/edit.html.haml" do
  before :each do
    @user = User.create(name: 'user1', email: 'test@kiprosh.com',
      password: 'password', password_confirmation: 'password')
    sign_in @user
  end

  it "renders the edit user form" do
    render
    assert_select "form", :action => user_path(@user), method: "post" do
      assert_select "input#user_name", name: "user[name]"
      assert_select "img", src: avatar_url(@user, 45)
    end
  end
end