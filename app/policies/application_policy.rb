class ApplicationPolicy < Struct.new(:user, :record)

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user ? user.role?(:administrator) : false
  end

  def update?
    user ? user.role?(:administrator) : false
  end

  def destroy?
    user ? user.role?(:administrator) : false
  end

end
