# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# LOCALES
#

locale_de = Locale.create name: 'de'
locale_en = Locale.create name: 'en'

#
# ACCOUNTS
#

account_max = Account.create do |account|
  account.email = "max.mustermann@example.com"
  account.password = "geheim"
  account.activated = true
end

account_leo = Account.create do |account|
  account.email = "leo.back@yahoo.de"
  account.password = "lalala"
  account.activated = true
end

account_simon = Account.create do |account|
  account.email = "simonstrack@outlook.com"
  account.password = "savepassword"
  account.activated = true
end

account_tatjana = Account.create do |account|
  account.email = "m.tatjana-94@hotmail.de"
  account.password = "geheim"
  account.activated = true
end

account_tobias = Account.create do |account|
  account.email = "tobiasuhmann@gmail.com"
  account.password = "aloha"
  account.activated = true
end

#
# CONFIGURATIONS
#

configuration_max = Configuration.create do |configuration|
  configuration.avatar = "max.jpg"

  configuration.account = account_max
  configuration.locale = locale_de
end

configuration_leo = Configuration.create do |configuration|
  configuration.avatar = "leo.jpg"

  configuration.account = account_leo
  configuration.locale = locale_de
end

configuration_simon = Configuration.create do |configuration|
  configuration.avatar = "simon.jpg"

  configuration.account = account_simon
  configuration.locale = locale_en
end

configuration_tatjana = Configuration.create do |configuration|
  configuration.avatar = "tatjana.jpg"

  configuration.account = account_tatjana
  configuration.locale = locale_en
end

configuration_tobias = Configuration.create do |configuration|
  configuration.avatar = "tobias.jpg"

  configuration.account = account_tobias
  configuration.locale = locale_en
end

#
# CURRENCIES
#

currency_dollar = Currency.create do |currency|
  currency.name = "USD"
  currency.symbol = "$"
end

currency_euro = Currency.create do |currency|
  currency.name = "EUR"
  currency.symbol = "€"
end

#
# CATEGORIES
#

category_max_ibm = Category.create do |category|
  category.name = "IBM"
  category.color = "#303f9f"
  category.icon = "baseline-euro_symbol-24px.svg"
  category.incomeExpense = 0

  category.configuration = configuration_max
end

category_max_surfschule = Category.create do |category|
  category.name = "Surfschule"
  category.color = "#303f9f"
  category.icon = "baseline-euro_symbol-24px.svg"
  category.incomeExpense = 0

  category.configuration = configuration_max
end

category_max_andereEinnahmen = Category.create do |category|
  category.name = "Andere Einnahmen"
  category.color = "#388e3c"
  category.icon = "baseline-monetization_on-24px.svg"
  category.incomeExpense = 0

  category.configuration = configuration_max
end

category_max_unterhaltung = Category.create do |category|
  category.name = "Unterhaltung"
  category.color = "#fbc02d"
  category.icon = "baseline-sentiment_satisfied_alt-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_lebensmittel = Category.create do |category|
  category.name = "Lebensmittel"
  category.color = "#c2185b"
  category.icon = "baseline-shopping_cart-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_essenGehen = Category.create do |category|
  category.name = "Essen gehen"
  category.color = "#d32f2f"
  category.icon = "baseline-local_dining-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_haus = Category.create do |category|
  category.name = "Haus"
  category.color = "#5d4037"
  category.icon = "baseline-home-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_sport = Category.create do |category|
  category.name = "Sport"
  category.color = "#ffa000"
  category.icon = "baseline-directions_run-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_telefon = Category.create do |category|
  category.name = "Telefon"
  category.color = "#303f9f"
  category.icon = "baseline-call-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_bildung = Category.create do |category|
  category.name = "Bildung"
  category.color = "#CC33FF"
  category.icon = "baseline-create-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

# category_max_reisen = Category.create do |category|
#   category.name = "Reisen"
#   category.color = "#1976d2"
#   category.icon = "baseline-card_travel-24px.svg"
#   category.incomeExpense = 1
#
#   category.configuration = configuration_max
# end

category_max_rauchen = Category.create do |category|
  category.name = "Rauchen"
  category.color = "#455a64"
  category.icon = "baseline-smoking_rooms-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_kinder = Category.create do |category|
  category.name = "Kinder"
  category.color = "#388e3c"
  category.icon = "baseline-child_friendly-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end

category_max_auto = Category.create do |category|
  category.name = "Auto"
  category.color = "#1976d2"
  category.icon = "baseline-directions_car-24px.svg"
  category.incomeExpense = 1

  category.configuration = configuration_max
end


#
# ENTRIES
#

#IBM
entry_max_gehaltJuli = Entry.create do |entry|
  entry.title = "Gehalt Juli"
  entry.amount = 4500
  entry.date = Date.new 2020, 1, 29
  entry.photo = "gehalt.jpg"

  entry.category = category_max_ibm
  entry.currency = currency_euro
end

entry_max_gehaltAugust = Entry.create do |entry|
  entry.title = "Gehalt August"
  entry.amount = 4200
  entry.date = Date.new 2020, 1, 30
  entry.photo = "gehalt.jpg"

  entry.category = category_max_ibm
  entry.currency = currency_euro
end

entry_max_gehaltSeptember = Entry.create do |entry|
  entry.title = "Gehalt September"
  entry.amount = 4200
  entry.date = Date.new 2020, 2, 21
  entry.photo = "gehalt.jpg"

  entry.category = category_max_ibm
  entry.currency = currency_euro
end

entry_max_gehaltOktober = Entry.create do |entry|
  entry.title = "Gehalt Oktober"
  entry.amount = 4000
  entry.date = Date.new 2020, 2, 8
  entry.photo = "gehalt.jpg"

  entry.category = category_max_ibm
  entry.currency = currency_euro
end

#Surfschule
entry_max_surfkursAnfaenger = Entry.create do |entry|
  entry.title = "Surfkurs Anfänger"
  entry.amount = 600
  entry.date = Date.new 2020, 2, 12
  entry.photo = "surfkurs.jpg"

  entry.category = category_max_surfschule
  entry.currency = currency_euro
end

entry_max_surfkursFortgeschritten = Entry.create do |entry|
  entry.title = "Surfkurs Fortgeschritten"
  entry.amount = 720
  entry.date = Date.new 2020, 2, 12
  entry.photo = "surfkurs.jpg"

  entry.category = category_max_surfschule
  entry.currency = currency_euro
end

#Andere Einnahmen
entry_max_nachhilfeTag1 = Entry.create do |entry|
  entry.title = "Nachhilfe Tag1"
  entry.amount = 25
  entry.date = Date.new 2020, 2, 11
  entry.photo = "nachhilfe.jpg"

  entry.category = category_max_andereEinnahmen
  entry.currency = currency_euro
end

entry_max_nachhilfeTag2 = Entry.create do |entry|
  entry.title = "Nachhilfe Tag2"
  entry.amount = 25
  entry.date = Date.new 2020, 2, 12
  entry.photo = "nachhilfe.jpg"

  entry.category = category_max_andereEinnahmen
  entry.currency = currency_euro
end

#Unterhaltung
entry_max_kino = Entry.create do |entry|
  entry.title = "Kino"
  entry.amount = -8.50
  entry.date = Date.new 2020, 2, 12
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_zooBesuch = Entry.create do |entry|
  entry.title = "ZooBesuch"
  entry.amount = -12.50
  entry.date = Date.new 2020, 2, 2
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_trampolienPark = Entry.create do |entry|
  entry.title = "TrampolienPark "
  entry.amount = -30.50
  entry.date = Date.new 2020, 2, 5
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_sauna = Entry.create do |entry|
  entry.title = "Sauna"
  entry.amount = -12
  entry.date = Date.new 2020, 2, 7
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_schwimmbadOpelbad = Entry.create do |entry|
  entry.title = "Schwimmbad Opelbad"
  entry.amount = -8.50
  entry.date = Date.new 2020, 2, 13
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_taiMassage = Entry.create do |entry|
  entry.title = "Tai Message"
  entry.amount = -23.50
  entry.date = Date.new 2020, 2, 11
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end

entry_max_fußballSpiel = Entry.create do |entry|
  entry.title = "Fußball Spiel"
  entry.amount = -50.50
  entry.date = Date.new 2020, 1, 20
  entry.photo = "unterhaltung.jpg"

  entry.category = category_max_unterhaltung
  entry.currency = currency_euro
end




#Lebensmittel
entry_max_rewe = Entry.create do |entry|
  entry.title = "Rewe"
  entry.amount = -123.50
  entry.date = Date.new 2020, 1, 20
  entry.photo = "lebensmittel.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end

entry_max_markt = Entry.create do |entry|
  entry.title = "markt"
  entry.amount = -60.50
  entry.date = Date.new 2020, 1, 18
  entry.photo = "markt.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end

entry_max_alnatura = Entry.create do |entry|
  entry.title = "Alnatura"
  entry.amount = -23.62
  entry.date = Date.new 2020, 2, 9
  entry.photo = "lebensmittel.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end

entry_max_aldi = Entry.create do |entry|
  entry.title = "Aldi"
  entry.amount = -34.50
  entry.date = Date.new 2020, 2, 4
  entry.photo = "lebensmittel.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end

entry_max_obstBar = Entry.create do |entry|
  entry.title = "ObstBar"
  entry.amount = -5.50
  entry.date = Date.new 2020, 9, 20
  entry.photo = "lebensmittel.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end

entry_max_rewe = Entry.create do |entry|
  entry.title = "Rewe"
  entry.amount = -71.50
  entry.date = Date.new 2020, 9, 16
  entry.photo = "lebensmittel.jpg"

  entry.category = category_max_lebensmittel
  entry.currency = currency_euro
end




#Essen gehen
entry_max_mensa = Entry.create do |entry|
  entry.title = "Mensa"
  entry.amount = -3.50
  entry.date = Date.new 2020, 9, 11
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end

entry_max_mensa = Entry.create do |entry|
  entry.title = "Mensa"
  entry.amount = -3.50
  entry.date = Date.new 2020, 2, 5
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end

entry_max_RestaurantAlberto = Entry.create do |entry|
  entry.title = "Restaurant Alberto"
  entry.amount = -13.50
  entry.date = Date.new 2020, 2, 6
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end


entry_max_SushiExpress = Entry.create do |entry|
  entry.title = "Sushi Express"
  entry.amount = -13.50
  entry.date = Date.new 2020, 9, 21
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end


entry_max_Pizzaria = Entry.create do |entry|
  entry.title = "Pizzaria"
  entry.amount = -8.50
  entry.date = Date.new 2020, 2, 13
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end


entry_max_SushiExpress = Entry.create do |entry|
  entry.title = "Sushi Express"
  entry.amount = -13.50
  entry.date = Date.new 2020, 9, 21
  entry.photo = "essenGehen.jpg"

  entry.category = category_max_essenGehen
  entry.currency = currency_euro
end


#Haus
entry_max_Couch = Entry.create do |entry|
  entry.title = "Couch"
  entry.amount = -103.50
  entry.date = Date.new 2020, 9, 21
  entry.photo = "haus.jpg"

  entry.category = category_max_haus
  entry.currency = currency_euro
end

entry_max_Renovierung = Entry.create do |entry|
  entry.title = "Renovierung"
  entry.amount = -53.50
  entry.date = Date.new 2020, 2, 11
  entry.photo = "haus.jpg"

  entry.category = category_max_haus
  entry.currency = currency_euro
end

entry_max_kueche = Entry.create do |entry|
  entry.title = "Küche"
  entry.amount = -2100.50
  entry.date = Date.new 2020, 8, 18
  entry.photo = "haus.jpg"

  entry.category = category_max_haus
  entry.currency = currency_euro
end

entry_max_StromRechnung= Entry.create do |entry|
  entry.title = "Couch"
  entry.amount = -63.50
  entry.date = Date.new 2020, 9, 10
  entry.photo = "haus.jpg"

  entry.category = category_max_haus
  entry.currency = currency_euro
end

# #Reisen
# entry_max_frankreich = Entry.create do |entry|
#   entry.title = "Frankreich"
#   entry.amount = -253
#   entry.date = Date.new 2020, 2, 1
#   entry.photo = "frankreich.jpg"
#
#   entry.category = category_max_reisen
#   entry.currency = currency_euro
# end
#
# entry_max_florida = Entry.create do |entry|
#   entry.title = "Florida"
#   entry.amount = -1271
#   entry.date = Date.new 2020, 2, 10
#   entry.photo = "florida.jpg"
#
#   entry.category = category_max_reisen
#   entry.currency = currency_euro
# end
#
# entry_max_schwarzwald = Entry.create do |entry|
#   entry.title = "schwarzwald"
#   entry.amount = -589
#   entry.date = Date.new 2020, 9, 16
#   entry.photo = "schwarzwald.jpg"
#
#   entry.category = category_max_reisen
#   entry.currency = currency_euro
# end

#Kinder
entry_max_geburtstag = Entry.create do |entry|
  entry.title = "Geburtstag"
  entry.amount = -123
  entry.date = Date.new 2020, 2, 4
  entry.photo = "geburtstag.jpg"

  entry.category = category_max_kinder
  entry.currency = currency_euro
end

entry_max_schulmatrialien = Entry.create do |entry|
  entry.title = "Schulmatrialien"
  entry.amount = -12.23
  entry.date = Date.new 2020, 2, 1
  entry.photo = "schulmatrialien.jpg"

  entry.category = category_max_kinder
  entry.currency = currency_euro
end

entry_max_rennauto = Entry.create do |entry|
  entry.title = "Rennauto"
  entry.amount = -15
  entry.date = Date.new 2020, 9, 21
  entry.photo = "rennauto.jpg"

  entry.category = category_max_kinder
  entry.currency = currency_euro
end

#Telefon
entry_max_flatJuni = Entry.create do |entry|
  entry.title = "flatJuni"
  entry.amount = -12.13
  entry.date = Date.new 2020, 6, 27
  entry.photo = "flatJuni.jpg"

  entry.category = category_max_telefon
  entry.currency = currency_euro
end

entry_max_flatAugust = Entry.create do |entry|
  entry.title = "flatAugust"
  entry.amount = -76.23
  entry.date = Date.new 2020, 8, 27
  entry.photo = "flatAugust.jpg"

  entry.category = category_max_telefon
  entry.currency = currency_euro
end

entry_max_flatSeptember = Entry.create do |entry|
  entry.title = "flatSeptember"
  entry.amount = -22.89
  entry.date = Date.new 2020, 8, 27
  entry.photo = "flatSeptember.jpg"

  entry.category = category_max_telefon
  entry.currency = currency_euro
end

entry_max_flatOktober = Entry.create do |entry|
  entry.title = "flatOktober"
  entry.amount = -36.45
  entry.date = Date.new 2020, 2, 7
  entry.photo = "flatOktober.jpg"

  entry.category = category_max_telefon
  entry.currency = currency_euro
end

#Auto
entry_max_benzin= Entry.create do |entry|
  entry.title = "Benzin"
  entry.amount = -43.20
  entry.date = Date.new 2020, 7, 18
  entry.photo = "benzin.jpg"

  entry.category = category_max_auto
  entry.currency = currency_euro
end

entry_max_benzin= Entry.create do |entry|
  entry.title = "Benzin"
  entry.amount = -51.10
  entry.date = Date.new 2020, 8, 10
  entry.photo = "benzin.jpg"

  entry.category = category_max_auto
  entry.currency = currency_euro
end

entry_max_benzin= Entry.create do |entry|
  entry.title = "Benzin"
  entry.amount = -39.50
  entry.date = Date.new 2020, 2, 9
  entry.photo = "benzin.jpg"

  entry.category = category_max_auto
  entry.currency = currency_euro
end

entry_max_tüf= Entry.create do |entry|
  entry.title = "TÜV"
  entry.amount = -150
  entry.date = Date.new 2020, 9, 5
  entry.photo = "tüv.jpg"

  entry.category = category_max_auto
  entry.currency = currency_euro
end

#bildung
entry_max_seminarProgrammierung = Entry.create do |entry|
  entry.title = "Seminar Programmierung"
  entry.amount = -1234.67
  entry.date = Date.new 2020, 9, 10
  entry.photo = "seminarProgrammierung.jpg"

  entry.category = category_max_bildung
  entry.currency = currency_euro
end

entry_max_dieGesetzeDerGewinner = Entry.create do |entry|
  entry.title = "Die Gesetze der Gewinner"
  entry.amount = -20
  entry.date = Date.new 2020, 9, 4
  entry.photo = "dieGesetzeDerGewinner.jpg"

  entry.category = category_max_bildung
  entry.currency = currency_euro
end



#Sport
entry_max_Fahrrad = Entry.create do |entry|
  entry.title = "Fahrrad"
  entry.amount = -230
  entry.date = Date.new 2020, 8, 4
  entry.photo = "fahrrad.jpg"

  entry.category = category_max_sport
  entry.currency = currency_euro
end

entry_max_FahrradTour = Entry.create do |entry|
  entry.title = "Fahrrad Tour"
  entry.amount = -50
  entry.date = Date.new 2020, 9, 1
  entry.photo = "fahrrad.jpg"

  entry.category = category_max_sport
  entry.currency = currency_euro
end

entry_max_handeln = Entry.create do |entry|
  entry.title = "Handeln"
  entry.amount = -45
  entry.date = Date.new 2020, 8, 16
  entry.photo = "fahrrad.jpg"

  entry.category = category_max_sport
  entry.currency = currency_euro
end



