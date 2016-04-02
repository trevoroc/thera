require 'rails_helper'
# require 'factory_girl'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UsersController, type: :controller do
  login_admin
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    Role.create({name: "Survivor", description: "Can create converstations and create and read messages"})
    Role.create({name: "Volunteer", description: "Can create messages and read any conversations"})
    Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
  end

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
  end

  describe "Create admin" do
    it "Creates an admin" do
      role = Role.where(:name => "Admin").first
      dict = {:role_id =>  "Admin",
              :password_confirmation => "test pass", :name => "test name",
              :password => "test pass", :email => "test_email@test.com" }
      post :create, {:user => dict}, valid_session
      expect(:user).to_not eq(nil)
    end
  end

end
