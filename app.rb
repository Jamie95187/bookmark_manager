require "sinatra/base"
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks_post' do
    Bookmark.create(url: params[:URL], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  run! if app_file == $0
end
