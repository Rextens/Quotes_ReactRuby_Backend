class QuotesController < ApplicationController
  respond_to :json

  before_action :authenticate_user!

  def index
    render json: Quote.all().order("quoteindex DESC")
  end

  def create
    if params[:quoteTitle] != nil
      checkQuotes = Quote.new(title: params[:quoteTitle], quoteindex: Quote.maximum("quoteindex") != nil ? Quote.maximum("quoteindex") + 1 : 0)
    else
      render json: {:status => false}
    
      return
    end

    if checkQuotes.save
      render json: {:status => Quote.all}
    else 
      render json: {:status => false}
    end
  end

  def udpate
  
    render "abc"
  end

  def destroy
  
    render "abc"
  end

  def randomQuotes

    firstQuote = Quote.order('RANDOM()').first
    secondQuote = Quote.where.not(id: firstQuote.id).order('RANDOM()').first

    tempArray = []

    tempArray.push(firstQuote)
    tempArray.push(secondQuote)

    render json: tempArray
  end

  def makeChoice
    if !(cookies().key?("expireDate"))
      cookies["expireDate"] = {
        value: 0,
        expires_in: 1.hour
      }

      cookies["countVotes"] = {
        value: 0
      }
    elsif cookies().key?("countVotes")
      cookies["countVotes"] = {
        value: cookies["countVotes"].to_i + 1
      }
    end


    if (cookies().key?("countVotes"))
      if(cookies["countVotes"].to_i < 6 && cookies["countVotes"].to_i > -1)
        if params['chosenQuote']['quoteindex'] < params['secondQuote']['quoteindex']
          Quote.where(title: params['chosenQuote']['title']).update(quoteindex: params['secondQuote']['quoteindex'])
          Quote.where(title: params['secondQuote']['title']).update(quoteindex: params['chosenQuote']['quoteindex'])
        end

        puts cookies["countVotes"]
      end
    else
      cookies["countVotes"] = 0
    end
    
    render json: ""
  end

  private
  def quote_param
    params.require(:todo).permit(:title, :done)
  end
end
