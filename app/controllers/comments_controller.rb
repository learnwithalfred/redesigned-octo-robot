  # frozen_string_literal: true

  class CommentsController < ApplicationController
    def create
      comment = Comment.new(comment_params)
      comment.save!
      render status: :created, json: comment.to_json(include: [:user])
    end

    private

      def comment_params
        params.require(:comment).permit(:content, :course_id, :user_id)
      end
  end
