sendSortRequestOfModel = (model_name) ->
  formData = $('#index_table_' + model_name + ' tbody').sortable('serialize')
  formData += '&' + $('meta[name=csrf-param]').attr('content') +
      '=' + encodeURIComponent($('meta[name=csrf-token]').attr('content'))
  console.log(formData)
  $.ajax
    type: 'post'
    data: formData
    dataType: 'script'
    url: '/admin/' + model_name + '/sort'

jQuery ($) ->
  if $('body.admin_sliders.index').length
    $('#index_table_sliders tbody').disableSelection()
    $('#index_table_sliders tbody').sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel('sliders')
