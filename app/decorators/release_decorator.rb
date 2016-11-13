class ReleaseDecorator < Draper::Decorator
  delegate_all

  def artists_names
    split_release? ? artists_names : object.artists.pluck(:name).join(' / ')
  end

  def split_release?
    object.artists.count > 1
  end
end
