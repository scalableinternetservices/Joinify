json.array!(@cliques) do |clique|
  json.extract! clique, :id, :name, :creator_id
  json.url clique_url(clique, format: :json)
end
