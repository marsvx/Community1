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
});
