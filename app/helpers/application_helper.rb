module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def alerts(options={})
    render_to_string(:partial => "/common/alerts", locals: options).html_safe
  end

  def base_errors(record, *extras)
    extras = extras || []
    render_to_string(:partial => "/common/base_errors", locals: {record: record, extras: extras}).html_safe
  end

  # for kaminari bootstrap views:
  # https://github.com/matenia/bootstrap-kaminari-views
  def paginate(objects, options = {})
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )

    content_tag :div, class: 'pagination-wrap' do
      super( objects, options )
    end
  end

  def site_config
    Rails.application.config.site_config
  end
end
