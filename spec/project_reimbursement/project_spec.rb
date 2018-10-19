require 'project_reimbursement/project'

module ProjectReimbursement

  describe Project do
    context 'start date and end date are different days' do
      it 'contains an array of ProjectDays for the length of the project' do
        project = Project.new(Date.new(2018, 10, 19), Date.new(2018, 10, 21), false)
        expect(project.project_days.count).to eq(3)
        expect(project.project_days[0].date === Date.new(2018, 10, 19)).to eq true
        expect(project.project_days[1].date === Date.new(2018, 10, 20)).to eq true
        expect(project.project_days[2].date === Date.new(2018, 10, 21)).to eq true
      end
    end

    context 'start date and end date are the same day' do
      it 'contains an array of ProjectDays containing only 1 entry' do
        project = Project.new(Date.new(2018, 10, 19), Date.new(2018, 10, 19), false)
        expect(project.project_days.count).to eq(1)
        expect(project.project_days[0].date === Date.new(2018, 10, 19)).to eq true
      end
    end
  end
end
