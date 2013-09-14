# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

n = News.create(created_by: "admin")
n.i18n_news.create(news_id: n.id, lang_iso639:"ru",
                   title:"Тематическое пивопитие", intro:"В баре")
n.i18n_news.create(news_id: n.id, lang_iso639:"en",
                   title:"Russian Beer", intro:"In the bar")

e = Event.create(country_iso3166: "se", url: "erlang-solutions.com")
e.i18n_events.create(event_id: e.id, lang_iso639: "ru",
                     title: "Конференция EUC 2014", city: "Стокгольм",
                     info: "Дерп")
e.i18n_events.create(event_id: e.id, lang_iso639: "en",
                     title: "EUC 2014", city: "Stockholm",
                     info: "Derp")

a = Article.create(url: "erlang-solutions.com", created_by: "admin")
a.i18n_articles.create(article_id: e.id, lang_iso639: "ru",
                       title: "Что такое Erlang?", intro: "В далеком 1985-м году группа разработчиков...",
                       body: "В далеком 1985-м году группа разработчиков из компьютерных лабораторий компании Ericsson решила создать язык, который идеально бы подходил для решения задач в телекоме. Шесть лет спустя, в 1991-м, миру был представлен такой язык – Erlang.")
a.i18n_articles.create(article_id: e.id, lang_iso639: "en",
                     title: "What is Erlang?", intro: "Long time ago in 1985 group of developers...",
                     body: "Long time ago in 1985 group of developers in Ericsson computer laboratory decided to create a new programming language, which would ideally fit for solving telecom problems. Six years later, in 1991, Erlang language was born.")

Country.create(country_iso3166: "se", lang_iso639: "en", country_name: "Sweden", lang_name: "swedish")
Country.create(country_iso3166: "se", lang_iso639: "ru", country_name: "Швеция", lang_name: "шведский")
Country.create(country_iso3166: "se", lang_iso639: "ua", country_name: "Швеція", lang_name: "шведська")
Country.create(country_iso3166: "ru", lang_iso639: "en", country_name: "Russia", lang_name: "russian")
Country.create(country_iso3166: "ru", lang_iso639: "ru", country_name: "Россия", lang_name: "русский")
Country.create(country_iso3166: "ru", lang_iso639: "ua", country_name: "Росія", lang_name: "російська")
Country.create(country_iso3166: "ua", lang_iso639: "en", country_name: "Ukraine", lang_name: "ukrainian")
Country.create(country_iso3166: "ua", lang_iso639: "ru", country_name: "Украина", lang_name: "украинский")
Country.create(country_iso3166: "ua", lang_iso639: "ua", country_name: "Україна", lang_name: "українська")
