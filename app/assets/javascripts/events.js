
function initMap() {
  var phelps = {lat: 34.416132699040645, lng: -119.84466075897217};
  $('#event_latitude').val(phelps.lat);
  $('#event_longitude').val(phelps.lng);

  if($("#map").length) {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: phelps
    });
    var marker = new google.maps.Marker({
      position: phelps,
      map: map
    });

    map.addListener('click', function(event) {
      console.log(event.latLng.lat(), event.latLng.lng());
      $('#event_latitude').val(event.latLng.lat());
      $('#event_longitude').val(event.latLng.lng());
      marker.setPosition(event.latLng);
    });
  }
}

$(document).on('turbolinks:load', function() {

  $("#location-button").on('click', function(event) {
    event.preventDefault();
    navigator.geolocation.getCurrentPosition(function(position){
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;
      console.log(lat, lng);
      $.ajax({
        url: "/events",
        type: "GET",
        data: {
          lat: lat,
          lng: lng
        },
        complete: function(response, status) {
          $('#events-content').html(response.responseText);
          console.log(response);
        }
      });
    }, function(error) {
      console.log(error)
    });
  });

});
