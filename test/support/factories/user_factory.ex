defmodule Bbank.UserFactory do
  alias Bbank.Users.User

  defmacro __using__(_opts) do
    quote do
      def json_user_factory do
        %{
          name: Faker.Person.name(),
          email: Faker.Internet.email(),
          password: "12345678"
        }
      end

      def json_bad_user_factory do
        %{
          name: nil,
          email: "dummy",
          password: "1234"
        }
      end

      def user_factory do
        %User{
          name: Faker.Person.name(),
          email: Faker.Internet.email(),
          password: "12345678"
        }
      end

      def bad_user_factory do
        %User{
          name: nil,
          email: "dummy",
          password: "1234"
        }
      end
    end
  end
end
