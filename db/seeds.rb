# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

News.create(created_by: "admin") do |n|
  I18nNews.create(news_id: n.id, lang_iso639:"ru",
    title:"Тематическое пивопитие", intro:"В баре")
end

Event.create(country_iso3166: "se", url: "erlang-solutions.com") do |e|
  I18nEvent.create(event_id: e.id, lang_iso639: "ru",
     title: "Конференция EUC 2014", city: "Стокгольм",
     info: "Дерп")
end

