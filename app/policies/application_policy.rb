# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :artist, :record

  def initialize(artist, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless artist
    @artist = artist
    @record = record
  end

  def index?
    true
  end

  def show?
    false
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
      if artist
          scope(@artist)
       else
         scope(@artist, @song)
       end
    end
  end
end
