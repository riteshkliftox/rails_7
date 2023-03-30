# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :error then 'danger'
    when :alert then 'warning'
    when :notice then 'info'
    else
      flash_type.to_s
    end
  end
end
