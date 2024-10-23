/* Regarding the text size:
Please make sure each page where you wish to change the text size includes 
<p class = "text-content"> YOUR TEXT HERE </p>
Feel free to change the font size to different sizes if necessary
*/

function changeTextSize(size) {
    console.log("Selected size: " + size);  // This will log the selected size
    const textContent = document.querySelectorAll('.text-content');
  
    textContent.forEach(function(el) {
      if (size === 'small') {
        el.style.fontSize = '12px';
      } else if (size === 'medium') {
        el.style.fontSize = '16px'; // Default size
      } else if (size === 'large') {
        el.style.fontSize = '20px';
      }
    });
  }