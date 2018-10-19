require 'date'
require 'project_reimbursement/project'

module ProjectReimbursement
  class ReimbursementService
    LOW_COST_CITY_TRAVEL_DAY_AMT = 45
    HIGH_COST_CITY_TRAVEL_DAY_AMT = 55
    LOW_COST_CITY_FULL_DAY_AMT = 75
    HIGH_COST_CITY_FULL_DAY_AMT = 85

    def initialize(projects)
      @projects = projects
    end

    def execute
      determine_travel_and_full_days
      # throw out same days, keep higher
      project_days.reduce(0) { |sum, project_day| sum + reimbursement(project_day) }
    end

    private

    def project_days
      @project_days ||= @projects.map(&:project_days).flatten.sort_by(&:date)
    end

    def determine_travel_and_full_days
      project_days.each_with_index do |project_day, index|
        # 1st and last days will always be travel days
        if index == 0 || index == project_days.size - 1
          project_day.travel = true
        else
          if between_two_consecutive_days?(project_day.date, project_days[index - 1].date, project_days[index + 1].date)
            project_day.travel = false
          else
            project_day.travel = true
          end
        end
      end
    end

    def between_two_consecutive_days?(checked_date, date_before, date_after)
      (checked_date.prev_day === date_before) && (checked_date.next_day === date_after)
    end

    def reimbursement(project_day)
      if project_day.travel
        project_day.high_cost ? HIGH_COST_CITY_TRAVEL_DAY_AMT : LOW_COST_CITY_TRAVEL_DAY_AMT
      else
        project_day.high_cost ? HIGH_COST_CITY_FULL_DAY_AMT : LOW_COST_CITY_FULL_DAY_AMT
      end
    end
  end
end
