module Api
  module V1
    class Api::V1::LecturesController < ApplicationController

      def index
        @subjects = Subject.where("title = ?", params[:keyword])
        render json: @subjects.to_json(
          except: [:teacher_id, :created_at, :updated_at],
          include: [
            {teacher: {except: [:created_at, :updated_at]}},
            {lectures: {except: [:subject_id, :created_at, :updated_at]}}
          ]
        )
      end

    end
  end
end
