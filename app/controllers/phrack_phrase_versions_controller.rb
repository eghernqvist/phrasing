class PhrackPhraseVersionsController < Phrack.parent_controller.constantize

  def destroy
    @phrack_phrase_version = PhrackPhraseVersion.find(params[:id])
    @phrack_phrase_version.destroy
    redirect_to edit_phrack_phrase_path(@phrack_phrase_version.phrack_phrase.id)
  end

end