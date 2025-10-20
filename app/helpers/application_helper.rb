module ApplicationHelper
  def navbar_link_to(name, path, args = {})
    link_to name, path, args.merge(class: li_class(path))
  end

  def navbar_button_to(name, path, args = {})
    button_to name, path, args.merge(class: li_class(path))
  end

  def navbar_ul_class
    %Q(font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row
       md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700).freeze
  end

  private

  def li_class(path)
     if current_page?(path)
      "block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0 dark:text-white md:dark:text-blue-500".freeze
     else
      "block py-2 px-3 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700
      md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent".freeze
     end
  end
end
