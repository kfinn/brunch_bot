defmodule BrunchBot.Foursquare do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.foursquare.com/v2"
  plug Tesla.Middleware.Query, [
    {:client_id, "2GUVOO0J0DGPKMBSIBX3VAKJYZEU4AQDTHIYSQOLEQ2MKMQW"},
    {:client_secret, "BDENC2SZZYC2UWQIFMA0VCIQA12VHM0VDRSTAMZFNF1WTEGK"},
    {:v, "20190329"}
  ]
  plug Tesla.Middleware.JSON

  def venue_recommendations() do
    get(
      "venues/explore",
      query: [
        ll: "40.6756838,-73.9780124",
        radius: 1000,
        limit: 10,
        section: "food",
        query: "brunch",
        time: "11am",
        day: "saturday"
      ]
    )
  end
end
