defmodule Constable.Interest do
  use Ecto.Model
  alias Constable.UserInterest
  alias Constable.AnnouncementInterest

  schema "interests" do
    field :name
    timestamps

    has_many :announcements_interests, AnnouncementInterest
    has_many :announcements, through: [:announcements_interests, :announcement]
    has_many :users_interests, UserInterest
    has_many :interested_users, through: [:users_interests, :user]
  end

  def changeset(interest, params) do
    interest
    |> cast(params, ~w(name))
    |> update_change(:name, &String.downcase/1)
  end
end