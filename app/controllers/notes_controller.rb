class NotesController < ApplicationController
before_action :set_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        format.html {redirect_to note_url(@note), notice: "Note was created successfully"}
      else
        format.html {render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html {redirect_to note_url(@note), notice: "Note was updated successfully"}
      else
        format.html {render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html {redirect_to notes_url, notice: "Note was deleted successfully"}
    end

  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
