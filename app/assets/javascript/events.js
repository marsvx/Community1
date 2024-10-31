document.addEventListener("DOMContentLoaded", function() {
    var collapseElement = document.getElementById("collapseOne");
    if (collapseElement) {
      collapseElement.addEventListener("shown.bs.collapse", function() {
        var button = document.querySelector('#headingOne .accordion-button');
        button.textContent = "Hide Events";
      });
  
      collapseElement.addEventListener("hidden.bs.collapse", function() {
        var button = document.querySelector('#headingOne .accordion-button');
        button.textContent = "Show All Events";
      });
    }
  
    const virtualYes = document.getElementById("is_virtual_yes");
    const virtualNo = document.getElementById("is_virtual_no");
    const virtualEventURL = document.getElementById("virtual_event_url");

    const streetField = document.getElementById("street_field");
    const cityField = document.getElementById("city_field");
    const zipcodeField = document.getElementById("zipcode_field");

    // Function to toggle the URL field and disable/enable address fields
    function toggleFields() {
        if (virtualYes.checked) {
        // Show URL field and disable address fields
        virtualEventURL.style.display = "block";
        streetField.disabled = true;
        cityField.disabled = true;
        zipcodeField.disabled = true;
        streetField.value = ""; // Clear the value
        cityField.value = "";   // Clear the value
        zipcodeField.value = ""; // Clear the value
        } else {
        // Hide URL field and enable address fields
        virtualEventURL.style.display = "none";
        streetField.disabled = false;
        cityField.disabled = false;
        zipcodeField.disabled = false;
        }
    }

    // Attach event listeners to the radio buttons
    if (virtualYes && virtualNo) {
        virtualYes.addEventListener("change", toggleFields);
        virtualNo.addEventListener("change", toggleFields);
    }


    // Initialize the visibility and state of fields on page load
    toggleFields();
});
  
