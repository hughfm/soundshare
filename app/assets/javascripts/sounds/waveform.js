$( document ).ready(function() {
  var GLOBAL_ACTIONS = {
      'play': function () {
          wavesurfer.playPause();
      },

      'back': function () {
          wavesurfer.skipBackward();
      },

      'forth': function () {
          wavesurfer.skipForward();
      },

      'toggle-mute': function () {
          wavesurfer.toggleMute();
      }
  };

  [].forEach.call(document.querySelectorAll('[data-action]'), function (el) {
      el.addEventListener('click', function (e) {
          var action = e.currentTarget.dataset.action;
          if (action in GLOBAL_ACTIONS) {
              e.preventDefault();
              GLOBAL_ACTIONS[action](e);
          }
      });
  });

  var wavesurfer = Object.create(WaveSurfer);

  wavesurfer.init({
    container: document.querySelector('#waveform'),
    waveColor: 'black',
    progressColor: 'gray'
  });

  var progressDiv = document.querySelector('#progress-bar');
  var progressBar = progressDiv.querySelector('.progress-bar');

  var showProgress = function (percent) {
      progressDiv.style.display = 'block';
      progressBar.style.width = percent + '%';
  };

  var hideProgress = function () {
      progressDiv.style.display = 'none';
  };

  wavesurfer.on('loading', showProgress);
  wavesurfer.on('ready', hideProgress);
  wavesurfer.on('destroy', hideProgress);
  wavesurfer.on('error', hideProgress);

  wavesurfer.on('ready', function() {
    [].forEach.call(document.querySelectorAll('[data-action]'), function (el) {
      $(el).removeAttr('disabled');
    });
  });

  window.wavesurfer = wavesurfer;
});
