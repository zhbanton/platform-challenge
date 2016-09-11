module LinkHelper

  def edit_link(path)
    link_to 'edit', path, class: 'btn btn-sm btn-primary'
  end

  def destroy_link(path)
    link_to 'destroy', path, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-sm btn-danger'
  end
end
