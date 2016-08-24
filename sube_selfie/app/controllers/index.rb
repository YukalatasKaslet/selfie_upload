get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @photos = Photo.all
  erb :selfie
end


post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!

  redirect '/'
end