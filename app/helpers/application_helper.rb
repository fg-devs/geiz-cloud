module ApplicationHelper

  # Go one page back (browser history)
  def history_back
    'javascript:history.go(-1);'
  end


  # Which bootstrap alert type?
  def get_bootstrap_alert_class(type)
    if type == 'error' || type == 'alert'
      'danger'
    elsif type == 'success'
      'success'
    elsif type == 'notice'
      'info'
    end
  end


end
