# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

beer_en = Tag.create(text: "beer", lang_iso639: "en")
beer_ru = Tag.create(text: "пиво", lang_iso639: "ru")
beer_ua = Tag.create(text: "пиво", lang_iso639: "ua")
erlang_en = Tag.create(text: "erlang", lang_iso639: "en")
erlang_ru = Tag.create(text: "эрланг", lang_iso639: "ru")
erlang_ua = Tag.create(text: "ерланг", lang_iso639: "ua")
#
#--------------------------------------------------------------------
#
a_joe = Author.create(name: "Joe Armstrong", url: "http://joearms.github.io/")
a_robert = Author.create(name: "Robert Virding", url: "http://rvirding.blogspot.se/")
#
#--------------------------------------------------------------------
#
url_esl = Url.create(url: "http://erlang-solutions.com", name: "Erlang Solutions Ltd.")
url_ec = Url.create(url: "http://erlangcentral.org", name: "Erlang Central")
Url.create(url: "http://erlang.org", name: "Erlang.org")
#
#--------------------------------------------------------------------
#
n = News.create(created_by: "admin")
NewsTag.create(news_id: n.id, tag_id: beer_en.id)
NewsTag.create(news_id: n.id, tag_id: beer_ru.id)
NewsTag.create(news_id: n.id, tag_id: beer_ua.id)
NewsTag.create(news_id: n.id, tag_id: erlang_en.id)
NewsTag.create(news_id: n.id, tag_id: erlang_ru.id)
NewsTag.create(news_id: n.id, tag_id: erlang_ua.id)
n.i18n_news.create(news_id: n.id, lang_iso639:"ru",
                   title:"Тематическое пивопитие", intro:"В баре",
                   body:"Какой же русский *не любит* выпить?", format: 'markdown'
                  )
n.i18n_news.create(news_id: n.id, lang_iso639:"en",
                   title:"Russian Beer", intro:"In the bar",
                   body: "It's<script>alert('a')</script> getting hot in here", format: 'html'
                  )
Relation.create(id1: n.id, type1: RESTYPE[:news], id2: url_esl.id, type2: RESTYPE[:url])
Relation.create(id1: n.id, type1: RESTYPE[:news], id2: a_robert.id, type2: RESTYPE[:author])
#
#--------------------------------------------------------------------
#
e = Event.create(country_iso3166: "se", url: "erlang-solutions.com",
                 googlemap_address: "Saltmätargatan 5, 11359, Stockholm")
EventTag.create(event_id: e.id, tag_id: beer_en.id)
EventTag.create(event_id: e.id, tag_id: beer_ru.id)
EventTag.create(event_id: e.id, tag_id: beer_ua.id)
EventTag.create(event_id: e.id, tag_id: erlang_en.id)
EventTag.create(event_id: e.id, tag_id: erlang_ru.id)
EventTag.create(event_id: e.id, tag_id: erlang_ua.id)
e.i18n_events.create(event_id: e.id, lang_iso639: "ru",
                     title: "Конференция EUC 2014", city: "Стокгольм",
                     info: "Дерп")
e.i18n_events.create(event_id: e.id, lang_iso639: "en",
                     title: "EUC 2014", city: "Stockholm",
                     info: "Derp")
Relation.create(id1: e.id, type1: RESTYPE[:event], id2: url_ec.id, type2: RESTYPE[:url])
Relation.create(id1: e.id, type1: RESTYPE[:event], id2: a_joe.id, type2: RESTYPE[:author])
#
#--------------------------------------------------------------------
#
a = Article.create(url: "erlang-solutions.com", created_by: "admin")
ArticleTag.create(article_id: a.id, tag_id: beer_en.id)
ArticleTag.create(article_id: a.id, tag_id: beer_ru.id)
ArticleTag.create(article_id: a.id, tag_id: beer_ua.id)
ArticleTag.create(article_id: a.id, tag_id: erlang_en.id)
ArticleTag.create(article_id: a.id, tag_id: erlang_ru.id)
ArticleTag.create(article_id: a.id, tag_id: erlang_ua.id)
a.i18n_articles.create(article_id: e.id, lang_iso639: "ru",
                       title: "Что такое Erlang?", intro: "В далеком 1985-м году группа разработчиков...",
                       body: "В далеком 1985-м году группа разработчиков из компьютерных лабораторий компании Ericsson решила создать язык, который идеально бы подходил для решения задач в телекоме. Шесть лет спустя, в 1991-м, миру был представлен такой язык – Erlang.")
a.i18n_articles.create(article_id: e.id, lang_iso639: "en",
                     title: "What is Erlang?", intro: "Long time ago in 1985 group of developers...",
                     body: "Long time ago in 1985 group of developers in Ericsson computer laboratory decided to create a new programming language, which would ideally fit for solving telecom problems. Six years later, in 1991, Erlang language was born.")
Relation.create(id1: a.id, type1: RESTYPE[:article], id2: url_ec.id, type2: RESTYPE[:url])
Relation.create(id1: a.id, type1: RESTYPE[:article], id2: a_joe.id, type2: RESTYPE[:author])
Relation.create(id1: a.id, type1: RESTYPE[:article], id2: e.id, type2: RESTYPE[:event])
Relation.create(id1: a.id, type1: RESTYPE[:article], id2: n.id, type2: RESTYPE[:news])
#
#--------------------------------------------------------------------
#
Country.create(country_iso3166: "se", lang_iso639: "en", country_name: "Sweden", lang_name: "swedish")
Country.create(country_iso3166: "se", lang_iso639: "ru", country_name: "Швеция", lang_name: "шведский")
Country.create(country_iso3166: "se", lang_iso639: "ua", country_name: "Швеція", lang_name: "шведська")
Country.create(country_iso3166: "ru", lang_iso639: "en", country_name: "Russia", lang_name: "russian")
Country.create(country_iso3166: "ru", lang_iso639: "ru", country_name: "Россия", lang_name: "русский")
Country.create(country_iso3166: "ru", lang_iso639: "ua", country_name: "Росія", lang_name: "російська")
Country.create(country_iso3166: "ua", lang_iso639: "en", country_name: "Ukraine", lang_name: "ukrainian")
Country.create(country_iso3166: "ua", lang_iso639: "ru", country_name: "Украина", lang_name: "украинский")
Country.create(country_iso3166: "ua", lang_iso639: "ua", country_name: "Україна", lang_name: "українська")

r1 = Resource.create(resource_type: 'pages')
Page.create(:title => 'и шо', :body => 'здра', :format => 'html', 'lang' => 'ru', :resource_id => r1.id)
Page.create(:title => 'what', :body => 'hello', :format => 'html', 'lang' => 'en', :resource_id => r1.id)

r2 = Resource.create(resource_type: 'pages')
Page.create(:title => 'и шо2', :body => 'здра2', :format => 'html', 'lang' => 'ru', :resource_id => r2.id)
Page.create(:title => 'what2', :body => 'hello2', :format => 'html', 'lang' => 'en', :resource_id => r2.id)

r1.resource_links << r2
