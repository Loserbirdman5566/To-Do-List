class Task < ApplicationRecord
  
  validates_presence_of :name, :due_date, :note


  def can_destroy?
    !overdue?
  end

  def overdue?
    due_date < Date.today
  end

end

