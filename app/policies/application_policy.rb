# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :artist, :record

  def initialize(artist, record)
    @artist = artist
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
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

  def scope
    Pundit.policy_scope!(artist, record.class)
 end

  class Scope
    attr_reader :artist, :scope

    def initialize(artist, scope)
      @artist = artist
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
