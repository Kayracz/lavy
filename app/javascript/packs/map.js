// import 'mapbox-gl/dist/mapbox-gl.css'
// // ADD THIS LINE 👇 (styling)
// import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
// // ADD THIS LINE 👇 (js)
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import 'mapbox-gl/dist/mapbox-gl.css'
//import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';
// import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css'

const mapElement = document.getElementById('map');



if (mapElement) {

  mapboxgl.accessToken = process.env.MAPBOX_API_KEY // API key from `.env`




  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/marcusloiseau1/cjoq9rncp5cji2sqmjkmg2bfv'
  });
  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {
    new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
  //     .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
  //       .setHTML(marker.infoWindow.content))
      .addTo(map);
    })

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }

  // map.addControl(new MapboxGeocoder({
  //   accessToken: mapboxgl.accessToken
  // }));

  // map.addControl(new MapboxDirections({
  //   accessToken: mapboxgl.accessToken
  // }), 'top-left');
  // map.style.width = "600px"

  // $('#map-trigger').click(setTimeout(function() {
  //   map.resize();
  //   console.log("teste")
  // }, 2000));

  const mapCanvas = document.getElementsByClassName('mapboxgl-canvas')[0];
  mapElement.style.width = "100%"
  // mapElement.style.height = "100%"
  mapCanvas.style.width = "100%"
  mapCanvas.style.height = "100%"
  // mapCanvas.style.height = "100%"
  // setTimeout(() => map.resize(), 2000)
  // setTimeout(() => console.log(mapCanvas), 2000)

  // console.log(mapCanvas)

}

