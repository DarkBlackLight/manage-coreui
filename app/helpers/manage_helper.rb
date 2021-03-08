module ManageHelper
  def manage_render_sidebar(routes)
    (routes.filter { |route| route[:can] }.map do |route|
      route[:children] ?
        (
          tag.li class: "c-sidebar-nav-dropdown" do
            (
              tag.a class: 'c-sidebar-nav-dropdown-toggle' do
                (tag.div (tag.i "", class: route[:icon]), class: 'c-sidebar-icon') + route[:name]
              end
            ) + (
              tag.ul class: "c-sidebar-nav-dropdown-items" do
                manage_render_sidebar(route[:children])
              end
            )
          end
        )
        :
        (
          tag.li class: "c-sidebar-nav-item" do
            link_to route[:url], class: "c-sidebar-nav-link" do
              (route[:icon] ? (tag.div (tag.i "", class: route[:icon]), class: 'c-sidebar-icon') : '') + route[:name]
            end
          end
        )
    end).inject { |sum, n| sum + n }
  end

  def manage_text_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.text_field field, options)
    end
  end

  def manage_email_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.email_field field, options)
    end
  end

  def manage_file_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.file_field field, options)
    end
  end

  def manage_password_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.password_field field, options)
    end
  end

  def manage_date_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control datepicker"
    tag.div class: 'form-group' do
      (form.label field) + (form.text_field field, options)
    end
  end

  def manage_datetime_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control datetimepicker"
    tag.div class: 'form-group' do
      (form.label field) + (form.text_field field, options)
    end
  end

  def manage_time_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.time_field field, options)
    end
  end

  def manage_number_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.number_field field, options)
    end
  end

  def manage_text_area_field(form, field, options = {})
    options[:class] = "#{options[:class]} form-control"
    tag.div class: 'form-group' do
      (form.label field) + (form.text_area field, options)
    end
  end

  def manage_collection_select_field(form, field, collection, value_method, text_method, options = {}, html_options = {})
    html_options[:class] = "#{html_options[:class]} form-control select2"
    tag.div class: 'form-group' do
      (form.label field) + (form.collection_select field, collection, value_method, text_method, options, html_options)
    end
  end

  def manage_select_field(form, field, choices, options = {}, html_options = {})
    html_options[:class] = "#{html_options[:class]} form-control select2"
    tag.div class: 'form-group' do
      (form.label field) + (form.select field, choices, options, html_options)
    end
  end

  def manage_text_tag(label, name, value, options = {})
    options[:class] = "#{options[:class]} form-control"
    manage_tag = (text_field_tag name, value, options)
    tag.div class: 'form-group' do
      (label ? ((label_tag label) + manage_tag) : manage_tag)
    end
  end

  def manage_number_tag(label, name, value, options = {})
    options[:class] = "#{options[:class]} form-control"
    manage_tag = (number_field_tag name, value, options)
    tag.div class: 'form-group' do
      (label ? ((label_tag label) + manage_tag) : manage_tag)
    end
  end

  def manage_collection_select_tag(label, name, value, collection, value_method, text_method, options = {})
    options[:class] = "#{options[:class]} form-control select2 "
    manage_tag = (select_tag name, options_from_collection_for_select(collection, value_method, text_method, value), options)
    tag.div class: 'form-group' do
      (label ? ((label_tag label) + manage_tag) : manage_tag)
    end
  end

  def manage_select_tag(label, name, value, choices, options = {})
    options[:class] = "#{options[:class]} form-control select2 "
    manage_tag = (select_tag name, options_for_select(choices, value), options)
    tag.div class: 'form-group' do
      (label ? ((label_tag label) + manage_tag) : manage_tag)
    end
  end

end

