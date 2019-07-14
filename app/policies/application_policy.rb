# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :current_artist, :record

  def initialize(current_artist, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless current_artist
    @current_artist = current_artist
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
    Pundit.policy_scope!(current_current_artist, record.class)
 end

  
end
