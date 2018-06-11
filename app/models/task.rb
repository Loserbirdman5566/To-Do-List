class Task < ApplicationRecord

  def can_destroy?
    !overdue?
  end

  def overdue?
    due_date < Date.today
  end

end

