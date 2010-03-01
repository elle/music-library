require 'init'

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

get '/' do
  fields = ['author','publisher', 'location', 'title', 'year', 'detail', 'style']

  query = params[:search]

  if query != nil
    # split the query by commas as well as spaces, just in case
    words = query.split(",").map(&:split).flatten

    binds = []    # bind symbols
    or_frags = [] # OR fragments

    words.each do |word|
      like_frags = []
      fields.each do |f| 
        like_frags << "LOWER(#{f}) LIKE ?" 
        binds << "#{word.to_s.downcase}%"
      end
      or_frags << "(#{like_frags.join(" OR ")})"
    end

    @albums = Album.all(:conditions => [or_frags.join(" AND "), *binds] )
  else
    @albums = Album.all
  end
  haml :root
  
end
