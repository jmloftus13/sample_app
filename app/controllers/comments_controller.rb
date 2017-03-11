class CommentsController < ApplicationController

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = request.env['warden'].user
    @comments = @product.comments.order(:id).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      if @comment.save
        #broadcast comment if comment passes validations & is saved in db.
        #ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        #ProductChannel.broadcast_to @product.id, comment:  # comment this out... average_rating: @product.average_rating
        #CommentsController.render(partial: 'comments/comment', locals: {comment: @comment, current_user: current_user}), average_rating: @product.average_rating
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end #end if/else
    end #end do
  end #end create method

	def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
	end #end destroy


	private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end #CommentsController