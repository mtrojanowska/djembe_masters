class ArtistPolicy < ApplicationPolicy

 def index?
    true
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
