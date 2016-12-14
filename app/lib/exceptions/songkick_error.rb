module Exceptions
  class SongkickError < StandardError
    def initialize(msg = 'Error while fetching events from Songkick')
      super
    end
  end
end
