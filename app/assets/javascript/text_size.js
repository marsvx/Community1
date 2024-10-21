function changeTextSize(size) {
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
  