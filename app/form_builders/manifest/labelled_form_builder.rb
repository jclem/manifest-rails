class Manifest::LabelledFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field check_box collection_select check_box text_area date_select datetime_select time_select].each do |method_name|
    define_method(method_name) do |name, *args|
      classes = %w[field]

      if %w[collection_select check_box].include? method_name
        classes << 'inline-label'
      end

      @template.content_tag :div, class: classes.join(' ') do
        label(name) + super(name, *args)
      end
    end
  end

  %w[submit].each do |method_name|
    define_method(method_name) do
      @template.content_tag :div, class: 'form-actions' do
        super()
      end
    end
  end
end
