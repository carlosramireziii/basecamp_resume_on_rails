// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

require("jquery")
require("bootstrap")
require("@fortawesome/fontawesome-free");

// Show filename in custom file input
document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll(".custom-file-input").forEach(function(fileInput) {
    fileInput.addEventListener("change", function(e) {
      var fileName = e.target.files[0].name;
      var nextSibling = e.target.nextElementSibling;
      nextSibling.innerText = fileName;
    });
  });
});

// A behavior to trigger a click on one element when another is clicked
document.addEventListener("turbolinks:load", function() {
  $(document).on("click", "[data-behavior*=click-delegate]", function(e) {
    const element = e.target;
    const target = element.dataset.target;
    document.querySelector(target).click();
  });
});
