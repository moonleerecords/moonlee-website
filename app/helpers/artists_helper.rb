module ArtistsHelper
  def years_active(formed, disbanded)
    disbanded ? "#{formed} - #{disbanded}" : formed
  end
end
