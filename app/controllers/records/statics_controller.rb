module Records
  class StaticsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def about
      custom_header(
        'About Us',
        '<strong>Moonlee Records</strong> is an independent record label established and run since 2004 by a handful of music enthusiasts from Slovenia and Croatia under the command of <strong>Mr. Moonlee</strong>, a giant lemon not very fond of being squeezed. In 2011 Moonlee Records expanded to <strong>Moonlee Booking</strong> to organise shows and tours for Moonlee bands in Slovenia and abroad.',
        'about/moonlee-about.svg'
      )
      meta_tags('About', 'Get in touch with us!')
    end
  end
end
