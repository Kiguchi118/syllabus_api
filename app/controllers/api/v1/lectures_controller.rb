module Api
  module V1
    class Api::V1::LecturesController < ApplicationController

      def index
        search_subject(params[:teacher_name], params[:keyword])
      end

      private

        # 検索文字の判断
        def search_subject(teacher_name, subject_title)
          # 検索文字がある場合
          if teacher_name.present? || subject_title.present?
            # 教師名がある場合
            if teacher_name.present?
              @subjects = Subject.
                            joins(:teacher).
                            where("teachers.name like ?", "%#{teacher_name}%")
              # 教師名かつ授業名がある時
              if subject_title.present?
                @subjects = @subjects.where("subjects.title like ?", "%#{subject_title}%")
              end
            # 科目名のみある場合
            elsif subject_title.present?
              @subjects = Subject.where("title like ?", "%#{subject_title}%")
            end

            is_match?(@subjects) # 一致する科目があるかどうか

          else  # 検索文字がない場合は，全ての科目出力
            @subjects = Subject.all
            render json: @subjects.to_json(
              except: [:teacher_id, :created_at, :updated_at],
              include: [
                {teacher: {except: [:created_at, :updated_at]}}
              ]
            )
          end
        end

        # 一致する科目が見つかっているか
        def is_match?(subjects)
          if subjects.present?
            render json: subjects.to_json(
              except: [:teacher_id, :created_at, :updated_at],
              include: [
                {teacher: {except: [:created_at, :updated_at]}},
                {lectures: {only: [:id, :title, :date]}}
              ]
            )
          else  # 一致するものが見つからない場合
             render json: { message: 'No match' }
          end
        end

    end
  end
end
