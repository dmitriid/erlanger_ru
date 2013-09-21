# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
#--------------------------------------------------------------------
#

tag1 = Resource.create(resource_type: 'tag')
Tag.create(:text => 'введение',
           :lang => 'ru',
           :resource_id => tag1.id
)
Tag.create(:text => 'intro',
           :lang => 'en',
           :resource_id => tag1.id
)

tag2 = Resource.create(resource_type: 'tag')
Tag.create(:text => 'КО',
           :lang => 'ru',
           :resource_id => tag2.id
)
Tag.create(:text => 'Captain obvious',
           :lang => 'en',
           :resource_id => tag2.id
)

tag3 = Resource.create(resource_type: 'tag')
Tag.create(:text => 'пииииво',
           :lang => 'ru',
           :resource_id => tag3.id
)
Tag.create(:text => 'beer',
           :lang => 'en',
           :resource_id => tag3.id
)

tag4 = Resource.create(resource_type: 'tag')
Tag.create(:text => 'эрланг',
           :lang => 'ru',
           :resource_id => tag4.id
)
Tag.create(:text => 'erlang',
           :lang => 'en',
           :resource_id => tag4.id
)

#
#--------------------------------------------------------------------
#


url1 = Resource.create(resource_type: 'url')
Url.create(:name => 'Русское коммьюнити',
           :url => 'http://erlanger.ru',
           :lang => '*',
           :resource_id => url1.id
          )

url2 = Resource.create(resource_type: 'url')
Url.create(:name => 'Non-russian community',
           :url => 'http://erlang.org',
           :lang => '*',
           :resource_id => url2.id
          )

url3 = Resource.create(resource_type: 'url')
Url.create(:name => 'Joe Armstrong',
           :url => 'http://joearms.github.io',
           :lang => '*',
           :resource_id => url3.id
          )

#
#--------------------------------------------------------------------
#


author1 = Resource.create(resource_type: 'author')
Author.create(:name => 'Джо Армстронг',
              :lang => 'ru',
              :resource_id => author1.id
              )
Author.create(:name => 'Joe Armstrong',
              :lang => 'en',
              :resource_id => author1.id
             )


author2 = Resource.create(resource_type: 'author')
Author.create(:name => 'Франческо Чезарини',
              :lang => 'ru',
              :resource_id => author2.id
              )
Author.create(:name => 'Francesco Cesarini',
              :lang => 'en',
              :resource_id => author2.id
             )

author1.resource_links << url3
#
#--------------------------------------------------------------------
#

news = Resource.create(resource_type: 'news')
News.create(:title => 'Тематическое пивопитие',
            :body => 'Какой же *русский* не -любит- выпить?',
            :format => 'markdown',
            :lang => 'ru',
            :resource_id => news.id
)
News.create(:title => 'Russian Beer',
            :body => "<p>It's <script>alert('a')</script> getting hot in here</p><iframe src=\"http://www.slideshare.net/slideshow/embed_code/12940017\" width=\"425\" height=\"355\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen></iframe>",
            :format => 'html',
            :lang => 'en',
            :resource_id => news.id
)

news.resource_links << tag3
news.resource_links << author1
news.resource_links << url1
news.resource_links << url2

#
#--------------------------------------------------------------------
#

country = Resource.create(resource_type: 'country')
Country.create(:name => 'Швеция',
               :lang => 'ru',
               :resource_id => country.id
)
Country.create(:name => 'Sweden',
               :lang => 'en',
               :resource_id => country.id
)

#
#--------------------------------------------------------------------
#

city = Resource.create(resource_type: 'city')
City.create(:name => 'Стокгольм',
            :lang => 'ru',
            :resource_id => city.id
)
City.create(:name => 'Stockholm',
            :lang => 'en',
            :resource_id => city.id
)

city.resource_links << country

#
#--------------------------------------------------------------------
#

event = Resource.create(resource_type: 'event')
Event.create(:title => 'Конференция EUC 2014',
             :body => 'Дерп',
             :format => 'markdown',
             :lang => 'ru',
             :address => 'Saltmätargatan 5, 11359',
             :resource_id => event.id
)
Event.create(:title => 'EUC 2014',
             :body => 'Derp',
             :format => 'html',
             :lang => 'en',
             :address => 'Saltmätargatan 5, 11359',
             :resource_id => event.id
)

event.resource_links << city
event.resource_links << tag4
event.resource_links << author2

#
#--------------------------------------------------------------------
#


article = Resource.create(resource_type: 'article')
Article.create(:title => 'Что такое Erlang?',
               :body => 'В далеком 1985-м году группа разработчиков из компьютерных лабораторий компании Ericsson решила создать язык, который идеально бы подходил для решения задач в телекоме. Шесть лет спустя, в 1991-м, миру был представлен такой язык – Erlang.',
               :format => 'html',
               :lang => 'ru',
               :resource_id => article.id
)
Article.create(:title => 'What is Erlang?',
               :body => 'Long time **ago** in __1985__ group of developers in Ericsson computer laboratory decided to create a new programming language, which would ideally fit for solving telecom problems. Six years later, in 1991, Erlang language was born.',
               :format => 'markdown',
               :lang => 'en',
               :resource_id => article.id
)


article.resource_links << tag1
article.resource_links << tag2
article.resource_links << event
article.resource_links << author1
article.resource_links << author2

news.resource_links << event
