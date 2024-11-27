defmodule BbankWeb.UsersControllerTest do
  use BbankWeb.ConnCase

  import Bbank.Factory

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      json_user = build(:json_user)
      %{email: email, name: name} = json_user

      response =
        conn
        |> post(~p"/api/users/", json_user)
        |> json_response(:created)

      assert %{
               "data" => %{"email" => ^email, "id" => _id, "name" => ^name},
               "message" => "User created"
             } = response
    end

    test "verifies email unique constraint", %{conn: conn} do
      params = %{name: "email_test", email: "email@dummy", password: "emaildummy"}

      Bbank.Users.create(params)

      response =
        conn
        |> post(~p"/api/users/", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"email" => ["has already been taken"]},
        "message" => "Changeset error"
      }

      assert expected_response == response
    end

    test "shows an error when it has invalid params", %{conn: conn} do
      params = %{
        name: nil,
        email: "dummydummy",
        password: "1234"
      }

      response =
        conn
        |> post(~p"/api/users/", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "email" => ["has invalid format"],
          "name" => ["can't be blank"],
          "password" => ["should be at least 8 character(s)"]
        },
        "message" => "Changeset error"
      }

      assert expected_response == response
    end
  end
end
