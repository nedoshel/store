module ApplicationHelper
  def navbar_link_to(name, path, args = {})
    link_to name, path, args.merge(class: default_li_class)
  end

  def navbar_button_to(name, path, args = {})
    button_to name, path, args.merge(class: default_li_class)
  end

  private

  def default_li_class
    "block py-2 px-3 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700
     md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent".freeze
  end
end
