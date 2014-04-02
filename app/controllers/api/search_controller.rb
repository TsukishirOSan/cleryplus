module Api
  class SearchController < ApplicationController
    def index
      head 418
    end

    def create
      if params[:q].present?
        @q = Institution.search(params[:q])
        @institutions = @q.result(distinct: true).includes(campuses: { survey_years: :assault_stats })

        render json: @institutions
      else
        head :bad_request
      end
    end
  end
end
