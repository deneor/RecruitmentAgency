# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#vacancy_skills_list').tokenInput '/skills/index.json',
    theme: 'facebook'
    minChars: 2
    hintText: 'Начните набирать умение'
    allowCustomEntry: true
    preventDuplicates: true
    noResultsText: "Не найдено"
    searchingText: "Поиск..."
    allowFreeTagging: true
    prePopulate: $('#vacancy_skills_list').data('load')