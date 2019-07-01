# frozen_string_literal: true

class SongPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def update?
    return true if artist.present? && artist == song.artist
  end

  def destroy?
    return true if artist.present? && artist == song.artist
  end

  private

  def song
    record
  end
end
