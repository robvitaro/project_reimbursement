module ProjectReimbursement
  ProjectDay = Struct.new(:date, :travel, :high_cost)

  class Project
    attr_reader :project_days

    def initialize(start_date, end_date, high_cost_city)
      @start_date = start_date
      @end_date = end_date
      @high_cost_city = high_cost_city
      @project_days = []

      create_project_days
    end

    private

    def create_project_days
      @start_date.upto(@end_date) do |date|
        @project_days << ProjectDay.new(date, nil, @high_cost_city)
      end
    end
  end
end
