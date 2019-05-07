/* window.onload = function() {
  var lng = 0;
  var lat = 0;
  function geocode(){
    var location = "15 Fletcher street Marrickville NSW";
    console.log(location)
    axios.get("https://maps.googleapis.com/maps/api/geocode/json", {
      params:{
        address:location,
        key:"<%= Rails.application.credentials.google_maps %>" 
      }
    })
    .then(function(response){
      console.log(response);

      lat  =  response.data.results[0].geometry.location.lat;
      console.log(lat);
      lng  =  response.data.results[0].geometry.location.lng; 
      console.log(lng);       
    })
    .catch(function(error){
      console.log(error); 
    });
  }
  console.log(lat);
  console.log(lng)
  geocode();
  var map; 
  function initMap() {
      var maplocation = {lat: lat, lng: lng};
    // The map, centered at location
      map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: maplocation});

    var marker = new google.maps.Marker({position: maplocation, map: map});
  }
} */