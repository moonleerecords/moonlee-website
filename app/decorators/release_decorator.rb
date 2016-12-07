class ReleaseDecorator < Draper::Decorator
  delegate_all

  def artists_names
    split_release? ? concat_artists_names : object.artists[0].name
  end

  def concat_artists_names
    object.artists.pluck(:name).map! { |name| name.index('/') ? name.slice(0..name.index('/') - 1).strip : name }.join(' / ')
  end

  def split_release?
    object.artists.count > 1
  end
end
