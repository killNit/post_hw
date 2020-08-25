class NotesController < ApplicationController
  def index
    @notes = Note.all
    puts "Kyle's mom is a big fat bitch!"
  end

  def show
    puts params[:id]
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to notes_path
    else
      render :new 
    end

end


  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    
    if @note.update(notes_params)
      redirect_to notes_path

    else render :edit
    end
  end


  private
 
  def notes_params
  params.require(:note).permit(:title, :author, :body)
  end
end
