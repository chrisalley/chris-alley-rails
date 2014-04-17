class PagePolicy < ApplicationPolicy
  
  class Scope < Struct.new(:user, :scope)
  
    def resolve
      if user
        return scope if user.role? :administrator
      end
      scope.where(publish: true)
    end

  end

  def show?
    if user
      return true if user.role? :administrator
    end
    record.publish?
  end

end
