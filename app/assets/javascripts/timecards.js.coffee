$ ->
  $('#datetimepicker1').datetimepicker()

$ ->
  $('#timecard_job_id').change ->
    id = $('#timecard_job_id option:selected').val()
    url = '/phases?job_id=' + id
    $.get url, (data) ->
      $('#timecard_phase_id').replaceWith data

$ ->
  $('#timecard_hours').focus ->
    @previousHoursValue = +($('#timecard_hours').val())
  $('#timecard_hours').change ->
    newHours = +($('#timecard_hours').val())
    totalHours = +($('#new_timecard_hours').text()) + newHours - @previousHoursValue
    $('#new_timecard_hours').html(totalHours)
