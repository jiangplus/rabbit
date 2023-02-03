require "test_helper"

class Api::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    get api_profiles_url
    p response.body

    post api_profiles_url, params: {username: "newuser", auth_token: "cvbnm", auth_data: "http://example.com/img.jpg"}
    p response.body

    get api_profile_url("newuer"), params: {username: "newuser"}
    p response.body

    post api_items_url, params: {auth_token: "cvbnm", recever_name: "another", data: "http://example.com/img.jpg", data: "good day", url: "http://example.com/img.jpg"}
    p response.body

    # profile = Profile.find_by(auth_token: params[:auth_token])

    # item = Item.create(
    #   sender: profile,
    #   recever_name: params[:recever_name],
    #   data: params[:data],
    #   url: params[:url],
    #   content: params[:content],
    #   )

    # # post api_group_create_url, params: {auth_token: auth_token, username: "nicedao", about: "nice commune", image_url: "http://example.com/img.jpg"}

  end
end
