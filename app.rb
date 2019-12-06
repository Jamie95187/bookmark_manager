require "sinatra/base"
require_relative "lib/bookmark"
require 'pg'

class BookmarkManager < Sinatra::Base

  enable :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
