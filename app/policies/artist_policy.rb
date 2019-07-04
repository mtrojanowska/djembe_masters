class ArtistPolicy < ApplicationPolicy

 def index?
    true
  end

  def update?
    artist.id == current_artist.id
  end

  def edit?
    update?
  end

  def destroy?
    artist.id == current_artist.id
  end

private

  def artist
    record
  end
end
