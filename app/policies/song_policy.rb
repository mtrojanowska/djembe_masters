# frozen_string_literal: true

class SongPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    artist.present?
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
