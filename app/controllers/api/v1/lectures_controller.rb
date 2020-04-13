module Api
  module V1
    class Api::V1::LecturesController < ApplicationController

      def index
        teacher_name = params[:teacher_name]
        subject_title = params[:keyword]
        if teacher_name.present?
          @subjects = Subject.
                        joins(:teacher).
                        where("teachers.name like ?", "%#{teacher_name}%")
          if subject_title.present?
            @subjects = @subjects.where("subjects.title like ?", "%#{subject_title}%")
          end
        elsif subject_title.present?
          @subjects = Subject.where("title like ?", "%#{subject_title}%")
        end

        # if params[:keyword].present? && params[:teacher_name].present?
        #   @subjects = Subject.
        #                 joins(:teacher).
        #                 where("(teachers.name = ?) AND (subjects.title = ?)",
        #                       params[:teacher_name], params[:keyword])
        # elsif params[:keyword].present?
        #   @subjects = Subject.where("title = ?", params[:keyword])
        # else
        #   @subjects = Subject.
        #                 joins(:teacher).
        #                 where("teachers.name = ?", params[:teacher_name])
        # end

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
