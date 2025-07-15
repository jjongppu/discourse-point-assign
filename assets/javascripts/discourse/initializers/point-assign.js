export default {
  name: 'point-assign',

  initialize() {
    const applyListener = () => {
      const form = document.getElementById('manual-points-form');
      if (!form) return;

      form.addEventListener('submit', function (e) {
        e.preventDefault();
        const data = new FormData(form);

        fetch('/admin/plugins/manual-points/api', {
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
          },
          body: data
        })
          .then((r) => {
            if (r.ok) {
              alert('✅ 포인트 지급 완료!');
              form.reset();
            } else {
              r.json().then((j) => {
                alert(`❌ 지급 실패: ${j.error || '알 수 없는 오류'}`);
              });
            }
          })
          .catch((err) => {
            alert(`❌ 요청 중 오류 발생: ${err.message}`);
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
