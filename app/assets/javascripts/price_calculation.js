$(function() {
  $('#location_id').change(function(event) {
    var location_id = event.target.value;
    $.get("/locations/" + location_id + "/day_parts").done(function(data) {
      var newSelect = $("<select id=\"selectId\" name=\"selectName\" />");
      data.day_parts.forEach(function(dayPart) {
        $("<option />", {value: dayPart.id, text: dayPart.name}).appendTo(newSelect);
      });
      $('.js-select-day-part').html(newSelect);
    });
  });
});
