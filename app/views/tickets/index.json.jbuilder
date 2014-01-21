json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :email, :number
  json.url ticket_url(ticket, format: :json)
end
