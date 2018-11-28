import "bootstrap";
import "../plugins/flatpickr";
import "./laundromats"
import starit from "./starit"
import new_review from "./new_review"

starit()
new_review()

const algoliaFields = document.querySelectorAll('.algolia-fields');

if (algoliaFields) {
  const places = require('places.js');
  algoliaFields.forEach((field) => {
    const placesAutocomplete = places({
      container: field
    });
  });
}
