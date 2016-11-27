require 'csv'
require File.expand_path('../seeds/import', __FILE__)

# TODO: buy links, reviews etc.

# TODO: remove this before official release. be sure to drop database and add user by hand
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# TODO: main image in admin is not working
# TODO: add album types (cd, digital etc)

importer = Import::Importer.new

importer.artists
importer.releases
importer.artist_releases

exit

ExternalLink.create(
  artist: analena,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Analena'
)
ExternalLink.create(
  artist: analena,
  url_type: 'bandcamp',
  url: 'https://analena.bandcamp.com/'
)
ExternalLink.create(
  artist: analena,
  url_type: 'facebook',
  url: 'https://www.facebook.com/ANALENA-6993242949'
)
ExternalLink.create(
  artist: analena,
  url_type: 'twitter',
  url: 'https://twitter.com/analenafire'
)
ExternalLink.create(
  artist: analena,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/415253-Analena'
)
ana_franjic = Member.create(
  name: 'Ana Franjić'
)
miodrag_gladovic = Member.create(
  name: 'Miodrag Gladović'
)
miran_rusjan = Member.create(
  name: 'Miran Rusjan'
)
dubravko_dragojevic = Member.create(
  name: 'Dubravko Dragojević'
)
ArtistMember.create(
  artist: analena,
  member: ana_franjic,
  role: 'vocals, bass'
)
ArtistMember.create(
  artist: analena,
  member: miodrag_gladovic,
  role: 'guitar, back vocals'
)
ArtistMember.create(
  artist: analena,
  member: miran_rusjan,
  role: 'guitar, back vocals'
)
ArtistMember.create(
  artist: analena,
  member: dubravko_dragojevic,
  role: 'drums'
)

kristina_gorovska = Member.create(
  name: 'Kristina Gorovska'
)
vasko_atanasoski = Member.create(
  name: 'Vasko Atanasoski'
)
deni_krstev = Member.create(
  name: 'Deni Krstev'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: kristina_gorovska,
  role: 'vocals'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: vasko_atanasoski,
  role: 'guitar'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: deni_krstev,
  role: 'rhythm programming and synthesizer'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Bernays+Propaganda'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'bandcamp',
  url: 'https://bernayspropaganda.bandcamp.com/'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'facebook',
  url: 'https://www.facebook.com/bernayspropaganda/'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1393536-Bernays-Propaganda'
)



edi_grubisic_cipla = Member.create(
  name: 'Edi Grubišić Cipal'
)
tin_oberman = Member.create(
  name: 'Tin Oberman'
)
luka_vrbanic = Member.create(
  name: 'Luka Vrbanic'
)
ArtistMember.create(
  artist: bilk,
  member: edi_grubisic_cipla,
  role: 'drums'
)
ArtistMember.create(
  artist: bilk,
  member: tin_oberman,
  role: 'synths, guitar'
)
ArtistMember.create(
  artist: bilk,
  member: luka_vrbanic,
  role: 'bass'
)
ExternalLink.create(
  artist: bilk,
  url_type: 'website',
  url: 'http://www.bilkspace.com/'
)
ExternalLink.create(
  artist: bilk,
  url_type: 'facebook',
  url: 'https://www.facebook.com/bilkspace/'
)
ExternalLink.create(
  artist: bilk,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Bilk'
)
ExternalLink.create(
  artist: bilk,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1817099-Bilk'
)


nikola_chang_ffos = Member.create(
  name: 'Nikola'
)
ivan_chang_ffos = Member.create(
  name: 'Ivan'
)
ashas_chang_ffos = Member.create(
  name: 'Ashas'
)
alen_chang_ffos = Member.create(
  name: 'Alen'
)
ArtistMember.create(
  artist: chang_ffos,
  member: nikola_chang_ffos,
  role: 'drums'
)
ArtistMember.create(
  artist: chang_ffos,
  member: ivan_chang_ffos,
  role: 'vocal'
)
ArtistMember.create(
  artist: chang_ffos,
  member: ashas_chang_ffos,
  role: 'guitar'
)
ArtistMember.create(
  artist: chang_ffos,
  member: alen_chang_ffos,
  role: 'bass'
)
ExternalLink.create(
  artist: chang_ffos,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Chang+Ffos'
)
ExternalLink.create(
  artist: chang_ffos,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1087188-Chang-Ffos'
)

mario_majkic = Member.create(
  name: 'Mario Majkić'
)
bojan_papic = Member.create(
  name: 'Bojan Papić'
)
antun_bilos = Member.create(
  name: 'Antun Biloš'
)
ArtistMember.create(
  artist: cog,
  member: mario_majkic,
  role: 'guitar, vocals'
)
ArtistMember.create(
  artist: cog,
  member: bojan_papic,
  role: 'bass'
)
ArtistMember.create(
  artist: cog,
  member: antun_bilos,
  role: 'drums'
)

petra_drazic = Member.create(
  name: 'Petra Dražić'
)
danijel_zec = Member.create(
  name: 'Danijel Zec'
)
marko_knez = Member.create(
  name: 'Marko Knez'
)
ArtistMember.create(
  artist: cripple_and_casino,
  member: petra_drazic,
  role: 'vocals'
)
ArtistMember.create(
  artist: cripple_and_casino,
  member: danijel_zec,
  role: 'bass'
)
ArtistMember.create(
  artist: cripple_and_casino,
  member: marko_knez,
  role: 'drums'
)

ExternalLink.create(
  artist: damir_avdic,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Damir+Avdi%C4%87'
)
ExternalLink.create(
  artist: damir_avdic,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1194965-Damir-Avdi%C4%87'
)
ExternalLink.create(
  artist: damir_avdic,
  url_type: 'bandcamp',
  url: 'https://damiravdic.bandcamp.com/'
)
damir_avdic_member = Member.create(
  name: 'Damir Avdić'
)
ArtistMember.create(
  artist: damir_avdic,
  member: damir_avdic_member,
  role: 'guitar, vocals'
)

ExternalLink.create(
  artist: debeli_precjednik,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Debeli+Precjednik'
)
ExternalLink.create(
  artist: debeli_precjednik,
  url_type: 'facebook',
  url: 'https://www.facebook.com/debeliprecjednik/'
)
ExternalLink.create(
  artist: debeli_precjednik,
  url_type: 'discogs',
  url: 'http://www.discogs.com/artist/Debeli+Precjednik'
)
ExternalLink.create(
  artist: debeli_precjednik,
  url_type: 'twitter',
  url: 'https://twitter.com/fatprezident'
)
ExternalLink.create(
  artist: debeli_precjednik,
  url_type: 'bandcamp',
  url: 'https://fatprezident.bandcamp.com/'
)
tin_kovacic = Member.create(
  name: 'Tin Kovačić'
)
davor_bestvina = Member.create(
  name: 'Davor Beštvina'
)
ivan_budaic = Member.create(
  name: 'Ivan Budaić'
)
sinisa_rajkovic = Member.create(
  name: 'Siniša Rajković'
)
igor_kovacevic = Member.create(
  name: 'Igor Kovačević'
)
ArtistMember.create(
  artist: debeli_precjednik,
  member: tin_kovacic,
  role: 'vocals'
)
ArtistMember.create(
  artist: debeli_precjednik,
  member: davor_bestvina,
  role: 'guitar'
)
ArtistMember.create(
  artist: debeli_precjednik,
  member: ivan_budaic,
  role: 'guitar'
)
ArtistMember.create(
  artist: debeli_precjednik,
  member: igor_kovacevic,
  role: 'bass'
)
ArtistMember.create(
  artist: debeli_precjednik,
  member: sinisa_rajkovic,
  role: 'drums'
)

neven_kamenski = Member.create(
  name: 'Neven Kamenski'
)
ozren_mlinaric = Member.create(
  name: 'Ozren Mlinarić'
)
sasa_relic = Member.create(
  name: 'Saša Relić'
)
slobodan_alavanja = Member.create(
  name: 'Slobodan Alavanja'
)
ArtistMember.create(
  artist: dont_mess_with_texas,
  member: neven_kamenski,
  role: 'keys'
)
ArtistMember.create(
  artist: dont_mess_with_texas,
  member: ozren_mlinaric,
  role: 'drums'
)
ArtistMember.create(
  artist: dont_mess_with_texas,
  member: sasa_relic,
  role: 'guitar'
)
ArtistMember.create(
  artist: dont_mess_with_texas,
  member: slobodan_alavanja,
  role: 'bass'
)

patrik_entreat = Member.create(
  name: 'Patrik'
)
matjaz_entreat = Member.create(
  name: 'Matjaž'
)
milos_entreat = Member.create(
  name: 'Miloš'
)
peter_entreat = Member.create(
  name: 'Peter'
)
ArtistMember.create(
  artist: entreat,
  member: patrik_entreat,
  role: 'vocals'
)
ArtistMember.create(
  artist: entreat,
  member: matjaz_entreat,
  role: 'guitar'
)
ArtistMember.create(
  artist: entreat,
  member: milos_entreat,
  role: 'guitar'
)
ArtistMember.create(
  artist: entreat,
  member: peter_entreat,
  role: 'drums'
)

el_chatedralico = Member.create(
  name: 'El Chatedralico'
)
juan_pablo_pa_de_rigat = Member.create(
  name: 'Juan Pablo Pe de Rigad'
)
gorgonzol_matadores = Member.create(
  name: 'Gorgonzol Matadores'
)
senor_monsenor_jose = Member.create(
  name: 'Senor monsenor Jose'
)
manolo_mago_porco = Member.create(
  name: 'Manolo Mago Porco'
)
ArtistMember.create(
  artist: hesus_attor,
  member: el_chatedralico,
  role: 'vocals'
)
ArtistMember.create(
  artist: hesus_attor,
  member: juan_pablo_pa_de_rigat,
  role: 'guitar'
)
ArtistMember.create(
  artist: hesus_attor,
  member: gorgonzol_matadores,
  role: 'guitar'
)
ArtistMember.create(
  artist: hesus_attor,
  member: senor_monsenor_jose,
  role: 'bass'
)
ArtistMember.create(
  artist: hesus_attor,
  member: manolo_mago_porco,
  role: 'drums'
)

mich_decruyenaere = Member.create(
  name: 'Mich Decruyenaere'
)
paul_lamont = Member.create(
  name: 'Paul Lamont'
)
olivier_wychuyse = Member.create(
  name: 'Olivier Wychuyse'
)
ArtistMember.create(
  artist: hitch,
  member: mich_decruyenaere,
  role: 'guitar, vocals'
)
ArtistMember.create(
  artist: hitch,
  member: paul_lamont,
  role: 'bass, vocals'
)
ArtistMember.create(
  artist: hitch,
  member: olivier_wychuyse,
  role: 'drums'
)

marko_rusjan = Member.create(
  name: 'Marko Rusjan'
)
jan_t_cernic = Member.create(
  name: 'Jan T. Černic'
)
ivo_lozej = Member.create(
  name: 'Ivo Lozej'
)
tomaz_usaj = Member.create(
  name: 'Tomaž Ušaj'
)
ArtistMember.create(
  artist: iamdisease,
  member: marko_rusjan,
  role: 'vocals'
)
ArtistMember.create(
  artist: iamdisease,
  member: jan_t_cernic,
  role: 'bass'
)
ArtistMember.create(
  artist: iamdisease,
  member: ivo_lozej,
  role: 'guitar'
)
ArtistMember.create(
  artist: iamdisease,
  member: tomaz_usaj,
  role: 'drums'
)

dario_solenicki = Member.create(
  name: 'Dario Solenički'
)
mateja_horvat = Member.create(
  name: 'Máteja Horvat'
)
sasa_segula = Member.create(
  name: 'Saša Šegula'
)
ArtistMember.create(
  artist: insane,
  member: dario_solenicki,
  role: 'guitar, vocals'
)
ArtistMember.create(
  artist: insane,
  member: mateja_horvat,
  role: 'bass, vocals'
)
ArtistMember.create(
  artist: insane,
  member: sasa_segula,
  role: 'drums'
)


nikola_ursic = Member.create(
  name: 'Nikola Uršić'
)
davor_bolant = Member.create(
  name: 'Davor Bolant'
)
bojan_kotzmuth = Member.create(
  name: 'Bojan Kotzmuth'
)
ArtistMember.create(
  artist: lunar,
  member: miodrag_gladovic,
  role: 'guitar'
)
ArtistMember.create(
  artist: lunar,
  member: davor_bolant,
  role: 'guitar'
)
ArtistMember.create(
  artist: lunar,
  member: nikola_ursic,
  role: 'bass'
)
ArtistMember.create(
  artist: lunar,
  member: bojan_kotzmuth,
  role: 'drums'
)

# TODO: members
ArtistRelease.create(
  artist: masinko,
  release: godina_majmuna
)


ExternalLink.create(
  artist: nikki_louder,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Nikki+Louder'
)
ExternalLink.create(
  artist: nikki_louder,
  url_type: 'facebook',
  url: 'https://www.facebook.com/Nikki-Louder-61342577710/'
)
ExternalLink.create(
  artist: nikki_louder,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1777425-Nikki-Louder'
)
ExternalLink.create(
  artist: nikki_louder,
  url_type: 'bandcamp',
  url: 'https://nikkilouder.bandcamp.com/'
)
blaz_sever = Member.create(
  name: 'Blaž Sever'
)
petar_cerar = Member.create(
  name: 'Petar Cerar'
)
luka_cerar = Member.create(
  name: 'Luka Cerar'
)
ArtistMember.create(
  artist: nikki_louder,
  member: blaz_sever,
  role: 'vocals, guitar'
)
ArtistMember.create(
  artist: nikki_louder,
  member: petar_cerar,
  role: 'bass, synth'
)
ArtistMember.create(
  artist: nikki_louder,
  member: luka_cerar,
  role: 'drums'
)

melanija_fabcic = Member.create(
  name: 'Melanija Fabčič'
)
jernej_savel = Member.create(
  name: 'Jernej Šavel'
)
saso_benko = Member.create(
  name: 'Sašo Benko'
)
janez_zlebcic = Member.create(
  name: 'Sašo Benko'
)
ArtistMember.create(
  artist: psycho_path,
  member: melanija_fabcic,
  role: 'vocals'
)
ArtistMember.create(
  artist: psycho_path,
  member: jernej_savel,
  role: 'guitar, back vocals'
)
ArtistMember.create(
  artist: psycho_path,
  member: saso_benko,
  role: 'guitar'
)
ArtistMember.create(
  artist: psycho_path,
  member: janez_zlebcic,
  role: 'bass'
)

boris_vlastelica = Member.create(
  name: 'Boris Vlastelica'
)
ana_marija_cupin = Member.create(
  name: 'Ana-Marija Cupin'
)
milena_milutinovic = Member.create(
  name: 'Milena Milutinović'
)
ArtistMember.create(
  artist: repetitor,
  member: boris_vlastelica,
  role: 'guitar, vocals'
)
ArtistMember.create(
  artist: repetitor,
  member: ana_marija_cupin,
  role: 'bass, vocals'
)
ArtistMember.create(
  artist: repetitor,
  member: milena_milutinovic,
  role: 'drums'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Repetitor'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'bandcamp',
  url: 'https://repetitor.bandcamp.com/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'twitter',
  url: 'https://twitter.com/repetitor_bg'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'facebook',
  url: 'https://www.facebook.com/repetitorbgd/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'instagram',
  url: 'https://www.instagram.com/repetitor_bgd/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1271681-Repetitor'
)
ReleaseReview.create(
  release: dobrodosli_na_okean,
  title: 'Some Will Never Know',
  url: 'http://www.swnk.org/reviews/repetitor-dobrodosli-na-okean/',
  quote: 'Even when you don’t understand a word, they know what a bit of good music sounds like.',
  rating: 80,
  max_rating: 100,
  language: 'English',
  visible: true
)
dobrodosli_na_okean_cd = ReleaseType.create(
  release: dobrodosli_na_okean,
  release_format: 'cd'
)
dobrodosli_na_okean_lp = ReleaseType.create(
  release: dobrodosli_na_okean,
  release_format: 'lp'
)
dobrodosli_na_okean_digital = ReleaseType.create(
  release: dobrodosli_na_okean,
  release_format: 'digital'
)
ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_cd,
  buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-cd.html'
)
ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_lp,
  buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-12inch-vinyl.html'
)
ReleaseTypeOtherBuyLink.create(
  title: 'Interpunk.com',
  release_type: dobrodosli_na_okean_cd,
  buy_url: 'http://interpunk.com/item.cfm?Item=208203'
)
ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_digital,
  buy_url: 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean'
)
ReleaseTypeOtherBuyLink.create(
  title: 'iTunes',
  release_type: dobrodosli_na_okean_digital,
  buy_url: 'https://itunes.apple.com/us/album/dobrodosli-na-okean/id583517090'
)

ExternalLink.create(
  artist: xaxaxa,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Xaxaxa'
)
ExternalLink.create(
  artist: xaxaxa,
  url_type: 'bandcamp',
  url: 'https://xaxaxa.bandcamp.com/'
)

# TODO: posts with introduction text

# Posts
Post.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl039-bernays-propaganda.jpg')),
  body: 'Macedonian activist musicians Bernays Propaganda have released their fourth album “Politika” today, March 14th 2016. Their new album, which sets an important milestone in band’s career, is released on the Slovenian independent label Moonlee Records available in the CD and LP formats, as well as a free download.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2016, 03, 14, 11, 34, 00),
  tags: ['2016', 'bernays propaganda', 'cd', 'european', 'macedonia', 'moonlee', 'notwist', 'politika', 'tour', 'vinyl'],
  categories: ['news']
)

Post.create(
  title: 'Werefox announce new album! Watch video for "Triads" now!',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl040-werefox.jpg')),
  body: 'Werefox, an alternative rock four-piece from Slovenia, have shared the long-awaited video for the song “Triads” and announced the release of their sophomore album “Das Lied der Maschinen”, coming out on February 4th 2016 on Moonlee Records.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2016, 01, 28, 11, 34, 00),
  tags: ['werefox', 'cd', 'release', 'triads', 'slovenia'],
  categories: ['news']
)

Post.create(
  title: 'Nikki Louder released "Trout"',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl038-nikki-louder.jpg')),
  body: 'Slovenian noise-rock trio Nikki Louder just released »Trout«, their fourth full-length, available both on CD and LP format and also as free download, which is result of cooperation between Moonlee Records and Založbe Radia Študent.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2015, 12, 15, 11, 34, 00),
  tags: ['nikki louder', 'lp', 'vinyl', 'cd', 'slovenia'],
  categories: ['news']
)

# Slides
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_001.png')),
  url: '/artists/bernays-propaganda',
  records: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_001.png')),
  url: '/artists/repetitor',
  records: true,
  position: 2
)
Slide.create(
  title: 'Vlasta Popić touring Balkans',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'vlasta_popic_001.png')),
  url: '/artists/vlasta-popic',
  records: true,
  position: 3
)
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_001.png')),
  url: '/artists/bernays-propaganda',
  booking: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_001.png')),
  url: '/artists/repetitor',
  booking: true,
  position: 2
)

# TODO: news import from XML
# TODO: album cover, band photos etc
# TODO: short name for artist? "Debeli Precjednik / Fat Prezident" -> "Debeli Precjednik"