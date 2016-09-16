defmodule Web.Clients.Kohana do
  use HTTPoison.Base

  @host Application.get_env(:web, :kohana)[:host]

  def process_url(url) do
    #@host <> url
    "https://edu-coosto.dev.coosto.nl" <> url
  end

  def process_request_headers(headers) do
    List.keyreplace(headers, "accept", 0, {"accept", "application/json"})
  end
end
