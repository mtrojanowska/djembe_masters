# frozen_string_literal: true

class SongPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    true
  end

  def update?
    return true if current_artist.present? && current_artist == song.artist
  end

  def destroy?
    return true if current_artist.present? && current_artist == song.artist
  end

  private

  def song
    record
  end
end
