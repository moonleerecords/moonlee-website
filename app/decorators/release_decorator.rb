class ReleaseDecorator < Draper::Decorator
  delegate_all

  def artists_names
    # TODO: Short name for artist (if there is /, return only first) Debeli Precjednik / Fat Prezident
    split_release? ? artists_names : object.artists.pluck(:name).join(' / ')
  end

  def split_release?
    object.artists.kind_of?(Array)
  end
end
