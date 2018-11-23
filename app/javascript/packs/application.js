import "bootstrap";
import "../plugins/flatpickr";

const algoliaFields = document.querySelectorAll('.algolia-fields');

if (algoliaFields) {
  const places = require('places.js');
  algoliaFields.forEach((field) => {
    const placesAutocomplete = places({
      container: field
    });
  });
}
