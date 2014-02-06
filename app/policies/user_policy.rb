class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present?
        scope.where(id: user.id)
      else
        return
      end
    end
  end
  def show?
    user == @user
  end
end
