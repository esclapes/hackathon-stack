defmodule Web.Terraformers.Kohana do  
  alias Web.Clients.Kohana
  use Plug.Router
  #require Logger

  plug :match
  plug :dispatch

  # catch all `get`s
  get _ do
    %{method: "GET", request_path: request_path, params: params, req_headers: req_headers} = conn
    res = Kohana.get!(request_path, req_headers, [hackney: [:insecure], params: Map.to_list(params)])
    #Logger.debug "elo"    
    send_response({:ok, conn, res})
  end

  match _, do: raise "Not implemented yet"

  defp send_response({:ok, conn, %{headers: headers, status_code: status_code, body: body}}) do
    conn = %{conn | resp_headers: headers}
    send_resp(conn, status_code, body)
  end

  defp send_response({_, conn, _}), do: send_resp(200,conn,"oooh") # tmp ;)
end
