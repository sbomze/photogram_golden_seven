class PhotosController <ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:src]
    cap = params[:cap]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    #render("photos/create_row.html.erb")
    redirect_to("/photos")
  end

  def show
    id = params[:id]
    @my_photo = Photo.find(id)
    render("photos/show.html.erb")
  end

  def edit_form
    @id = params[:id]
    @edit_photo = Photo.find(@id)
    render("photos/edit_form.html.erb")
  end

  def update_row
    id = params[:id]
    url = params[:input_src]
    cap = params[:input_cap]
    @update_photo = Photo.find(id)
    @update_photo.source = url
    @update_photo.caption = cap
    redirect_to("/photos/#{id}")
    @update_photo.save
  end

  def destroy_row
    render("/delete_photo/id.html.erb")
  end

end
