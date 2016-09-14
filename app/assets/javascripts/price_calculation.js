$(function() {
  $('#brand_id').change(function(event) {
    var brandId = event.target.value;
    $.get('/brands/' + brandId + '/relations').done(function(data) {
      ['location', 'order_type', 'menu_item', 'day_part'].forEach(function(modelName) {
        replaceSelect(modelName, data);
      });
    });
  });
  $(document).on('change', '#location_id', function(event) {
    var locationId = event.target.value;
    $.get("/locations/" + locationId + "/day_parts").done(function(data) {
      replaceSelect('day_part', data);
    });
  });

  var replaceSelect = function(modelName, data) {
    modelNameWithId = modelName + '_id';
    var newSelect = $('<select id=' + modelNameWithId + ' name=' + modelNameWithId + '/>');
    data[modelName + 's'].forEach(function(object) {
      $("<option />", {value: object._id['$oid'], text: object.name}).appendTo(newSelect);
    });
    $('#' + modelNameWithId).replaceWith(newSelect);
  };
});
