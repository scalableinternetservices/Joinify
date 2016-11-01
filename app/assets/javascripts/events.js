function initMap() {
  var phelps = {lat: 34.416132699040645, lng: -119.84466075897217};
  $('#event_latitude').val(phelps.lat);
  $('#event_longitude').val(phelps.lng);
  // var uluru = {lat: -25.363, lng: 131.044};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: phelps
  });
  var marker = new google.maps.Marker({
    position: phelps,
    map: map
  });

  console.log(marker);

  map.addListener('click', function(event) {
    console.log(event.latLng.lat(), event.latLng.lng());
    $('#event_latitude').val(event.latLng.lat());
    $('#event_longitude').val(event.latLng.lng());
    marker.setPosition(event.latLng);
  });
}
