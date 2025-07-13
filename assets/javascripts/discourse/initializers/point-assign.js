export default {
  name: 'point-assign',

  initialize() {
    const applyListener = () => {
      const form = document.getElementById('manual-points-form');
      if (!form) { return; }

      form.addEventListener('submit', function(e) {
        e.preventDefault();
        const data = new FormData(form);
        fetch('/admin/point-assign', {
          method: 'POST',
          headers: { 'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content },
          body: data
        }).then(r => {
          if (r.ok) {
            alert('Points granted');
            form.reset();
          } else {
            r.json().then(j => alert(j.error || 'Error'));
          }
        });
      });
    };

    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', applyListener);
    } else {
      applyListener();
    }
  }
};
