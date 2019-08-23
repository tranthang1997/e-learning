module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t("title")
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def get_stt page, per_page
    return 1 if page == 0
    (page - 1) * per_page + 1
  end

  def link_to_add_fields(name, f, association, opts={})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
      :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, h("add_fields(this,
      \"#{association}\", \"#{escape_javascript(fields)}\");return false;"),
      class: 'btn btn-success')
  end

  def link_to_function(name, js, opts={})
    link_to name, '#', opts.merge({onclick: js})
  end
end
