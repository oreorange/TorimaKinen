class SearchsController < ApplicationController
	def search
	  @model = params[:model]
	  @content = params[:content]
	  @method = params[:method]
	  if @model == 'user'
	  	# .page(params[:page]).reverse_order ページ機能実装のため追記
	    @records = User.search_for(@content, @method).page(params[:page]).reverse_order
	  else
	    @records = Event.search_for(@content, @method).page(params[:page]).reverse_order
	  end
	end
end
