  # frozen_string_literal: true

  class CommentsController < ApplicationController
    before_action :authenticate_user!

    def new
      @comment = Comment.new
    end

    def create
      @comment = current_user.comments.create(comment_params)
      redirect_to @comment.course
    end

    private

      def comment_params
        params.require(:comment).permit(:content, :course_id)
      end
  end
