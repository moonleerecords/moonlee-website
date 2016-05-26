require 'spec_helper'
require 'rake'

describe 'Songkick' do
  describe 'songkick:fetch_events' do
    before do
      load File.expand_path('../../../lib/tasks/songkick.rake', __FILE__)
      Rake::Task.define_task(:environment)
    end

    it '' do
      # TODO: have to fake it and load data from vcr or something
    end
  end
end
