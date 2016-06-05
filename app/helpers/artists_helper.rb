module ArtistsHelper
  def years_active(formed, disbanded)
    years_active = formed
    if disbanded
      years_active = "#{formed} - #{disbanded}"
    end
    years_active
  end
end
