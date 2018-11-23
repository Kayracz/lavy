import "bootstrap";
import "../plugins/flatpickr";

const addressInput = document.getElementById('laundromat_address');

if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}

