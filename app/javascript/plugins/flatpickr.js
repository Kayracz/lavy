import flatpickr from "flatpickr"
import "flatpickr/dist/themes/dark.css" // Note this is important!

flatpickr(".datepicker", {
  minDate: "today",
  dateFormat: "m/d"
})
