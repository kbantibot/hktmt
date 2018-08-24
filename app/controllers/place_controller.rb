require 'nokogiri'
require 'open-uri'
require 'uri'
class PlaceController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @plvalo =  Plval.where(:post_id => params[:post_id])
    @aa= @plvalo.count
    @plval =@plvalo.last
    @pl = Pl.new
    @pl.place = params[:place]
    @pl.month = params[:month]
    @pl.date = params[:date]
    @pl.people = params[:people]
    if @pl.place == "가평"
      url = "http://pensionlife.co.kr/room/roomsearch.html?s_date=2018-"+(@pl.month).to_s+"-"+(@pl.date).to_s+"&s_period="+(@post.date).to_s+"&s_area=2&s_more_area=35&s_num="+(@pl.people).to_s
      @list = []
      page = Nokogiri::HTML(open(url))
      @notices = []
      notice_list= page.css(".Full_list")
      notice_list.each do |notice|
        @notices << {
          title: notice.css(".Fullname").text,
          price: notice.css("em")[0].text,
          href: "http://pensionlife.co.kr"+notice.css("a")[0]["href"]
        }
      end
      @list ={
        모두의팬션: @notices
      }
    
    elsif @pl.place == "서울"
      url = "https://spacecloud.kr/search?q=%ED%8C%8C%ED%8B%B0%EB%A3%B8&useYmd=20180824&order=BEST_DESC"
      @list = []
      page = Nokogiri::HTML(open(url))
      @notices = []
      notice_list= page.css(".box.box_space") 
      notice_list.each do |notice|
        if notice.css(".tags").text.include?("#엠티")
        @notices  << {
          title: notice.css(".tit_space").text,
          price: notice.css(".price")[0].text,
          href: "https://spacecloud.kr"+notice.css("a")[0]["href"]
        }
        end
    
      end
      @list ={
        모두의팬션: @notices
      }  
    elsif @pl.place == "인천"
     url = "http://pensionlife.co.kr/room/roomsearch.html?s_date=2018-"+(@pl.month).to_s+"-"+(@pl.date).to_s+"&s_period="+(@post.date).to_s+"&s_area=11&s_more_area=171&s_num="+(@pl.people).to_s
      @list = []
      page = Nokogiri::HTML(open(url))
      @notices = []
      notice_list= page.css(".Full_list")
      notice_list.each do |notice|
        @notices << {
          title: notice.css(".Fullname").text,
          price: notice.css("em")[0].text,
          href: "http://pensionlife.co.kr"+notice.css("a")[0]["href"]
        }
      end
      @list ={
        모두의팬션: @notices
      }
    elsif @pl.place = "blank"
      @notices = []
      @notices << {
          title: "입력",
          price: "입력",
          href: "/post/index"
        }
    end
  end
  def create
    Plval.create(post_id: params[:post_id], place: params[:place],month: params[:month],date: params[:date],plname: params[:plname],price: params[:price],href: params[:href])
  end
  def gogo
    Calra.create(post_id: params[:post_id], rice: params[:rice],noodle: params[:noodle], fork: params[:fork],soju: params[:soju],beer: params[:beer])
  end
end
