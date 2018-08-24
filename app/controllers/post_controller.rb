class PostController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  def index
    @posts =Post.all
    
  end
  
  def tedit
  end
  
  def calu
    @post = Post.find(params[:post_id])
  end
  
  def calu_result
    @post = Post.find(params[:post_id])
    @male_num = params[:male_num]
    @female_num = params[:female_num]
    @sum_num = params[:sum_num]
    
    @bab = params[:food1]
    @noodle = params[:food2]
    @fork = params[:food3]
    
    
    @soju = params[:drink1]
    @beer = params[:drink2]
    
    @amount = params[:amount] 
    
    # 가격
    @a = 0
    if @bab == "bab"
     @a = @a + 1 
    end
    
    if @noodle == "noodle"
     @a = @a + 10
    end
    
    if @fork == "fork"
     @a = @a + 100
    end
    
    
        
    if @a == 100 #고기만 선택
     @num_rice = 0
     @num_noodle = 0
     
     @male_f = @male_num.to_f
     @female_f = @female_num.to_f
     
     @num_fork = (400 * @male_f + 300 * @female_f )/600
     @num_fork = @num_fork.ceil
     
    elsif @a == 101 # 밥, 고기 선택
     @num_noodle = 0
     
     @male_f = @male_num.to_f
     @female_f = @female_num.to_f
     
     @num_rice = (@male_f + @female_f) * 0.8
     @num_rice = @num_rice.ceil
     
     @num_fork = (400 * @male_f + 300 * @female_f) /600
     @num_fork = @num_fork.ceil
    
    elsif @a == 110 # 라면, 고기 선택
     @num_rice = 0
     
     @male_f = @male_num.to_f
     @female_f = @female_num.to_f
     
     @num_noodle = (@male_f + @female_f) * 0.8
     @num_noodle = @num_noodle.ceil
     
     @num_fork = (400 * @male_f  + 300 * @female_f)/600
     @num_fork = @num_fork.ceil
    
    elsif @a = 111 
     @male_f = @male_num.to_f
     @female_f = @female_num.to_f
     
     @num_rice = (@male_f + @female_f) * 0.4
     @num_rice = @num_rice.ceil
     
     @num_noodle = (@male_f + @female_f) * 0.3
     @num_noodle = @num_noodle.ceil
     
     @num_fork = (400 * @male_f + 300 * @female_f)/600
     @num_fork = @num_fork.ceil
     
    else @a <20
     redirect_to '/post/calu_angry' 
    end
    
    @b = 0
    if @soju == "soju"
     @b = @b + 10    
    end
    
    if @beer == "beer"
     @b = @b + 1
    end  
    
    if @amount == "hard"
     if @b < 2
      redirect_to '/post/calu_angry2'
     
     elsif @b == 10 #소주만 선택
      @num_beer = 0
      
      @sum_num = @sum_num.to_f
      @num_soju = @sum_num * 1.5
      
      @num_soju = @num_soju.ceil
      
     else @b = 11 
         
      @sum_num = @sum_num.to_f     
      @num_soju = 4.5 * @sum_num 
      @num_soju = @num_soju / 7
      @num_soju = @num_soju.ceil
      
      @num_beer = 4.5 * @sum_num
      @num_beer = @num_beer / 4
      @num_beer = @num_beer.ceil
     end
    end 
    
    if @amount == "normal"
     if @b < 2
      redirect_to '/post/calu_angry2'
     
     elsif @b == 10 #소주만 선택
      @num_beer = 0
      
      @sum_num = @sum_num.to_f
      @sum_num = @sum_num.to_f
      @num_soju = @sum_num * 1
      
     else @b = 11 
      @sum_num = @sum_num.to_f     
         
      @num_soju = 3 * @sum_num 
      @num_soju = @num_soju / 7
      @num_soju = @num_soju.ceil
      
      @num_beer = 3 * @sum_num
      @num_beer = @num_beer / 4
      @num_beer = @num_beer.ceil
     end
    end 
     
    if @amount == "easy"
     if @b < 2
      redirect_to '/post/calu_angry2'
     
     elsif @b == 10 #소주만 선택
      @num_beer = 0
      
      @sum_num = @sum_num.to_f
      @num_soju = @sum_num * 0.7
      @num_soju = @num_soju.ceil
      
     else @b = 11 
      @sum_num = @sum_num.to_f
      @num_soju = 1.5 * @sum_num 
      @num_soju = @num_soju / 7
      @num_soju = @num_soju.ceil
      
      @num_beer = 1.5 * @sum_num
      @num_beer = @num_beer / 4
      @num_beer = @num_beer.ceil
     end
    end
  end    
    
  def calu_angry
  end
  
  def calu_angry2
  end

  
  def new
  end
  
  def time
    @post = Post.find(params[:post_id])
    @ttmakings =  Ttmaking.where(:post_id => params[:post_id])

    @post.save
  end
  
  def create
  @post = Post.new
  @post.title = params[:mt_title]
  @post.content = params[:mt_content]
  @post.num_male = params[:mt_male_num]
  @post.num_female =params[:mt_female_num]
  @post.money = params[:mt_money]
  @post.date = params[:mt_date]
  @post.start = params[:mt_start]
  @post.fin = params[:mt_fin]
  @post.user_id = current_user.id
  @post.save
  
  redirect_to '/post/index'

  end

  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:mt_title]
    @post.content = params[:mt_content]
    @post.num_male = params[:mt_male_num]
    @post.num_female =params[:mt_female_num]
    @post.money = params[:mt_money]
    @post.date = params[:mt_date]
    @post.start = params[:mt_start]
    @post.fin = params[:mt_fin]
    @post.save

    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:post_id])
  end
  
  def etc
  end
  
  def etc_cal
  end
  
  def amidakuji
  end
  def lshow
   @post = Post.find(params[:post_id])
   @ttmakings =  Ttmaking.where(:post_id => params[:post_id])
   @c1 = @ttmakings.count
   @calrao= Calra.where(:post_id => params[:post_id])
   @calra=@calrao.last
   @c2 = @calrao.count
   @plvalo= Plval.where(:post_id => params[:post_id])
   @plval= @plvalo.last
   @c3 = @plvalo.count
  end
end  