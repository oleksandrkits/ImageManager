module ApplicationHelper

  def label_helper(form, text, id)
    form.label text, class: 'col-2 col-form-label', :for => id
  end
end
