$(document).ready(function() {
  $(document).on("upload:start", "form", function(e) {
    $(this).find("input[type=submit]").attr("disabled", true);
  });

  $(document).on("upload:progress", "form", function(e) {
    detail = e.originalEvent.detail;
    percentComplete = Math.round(detail.loaded / detail.total * 100);
    $("progress").val(percentComplete);
  });

  $(document).on("upload:complete", "form", function(e) {
    if(!$(this).find("input.uploading").length) {
      $(this).find("input[type=submit]").removeAttr("disabled");
    }
  });

  var wavesurfer = Object.create(WaveSurfer);

  wavesurfer.init({
    container: document.querySelector('#wave'),
    waveColor: 'black',
    progressColor: 'gray'
  });

  $('#sound_audio').on('change', function() {
    // if (e.dataTransfer.files.length) {
      debugger;
      wavesurfer.loadBlob($(this).val());
    // } else {
      // wavesurfer.fireEvent('error', 'Not a file');
    // }
  });

  // wavesurfer.on('loading', function(integer) {
  //   $('progress').val(integer);
  // });

  wavesurfer.on('ready', function () {
    // $('#progress').remove();
    // $('#wave i').remove();
    wavesurfer.play();
    // $('#loadButton').remove();
  });

  // wavesurfer.on('error', function() {
  //   $('#wave i').removeClass('fa-spinner');
  //   $('#wave i').removeClass('fa-pulse');
  //   $('#wave i').addClass('fa-exclamation-circle');
  //   $('#loadButton').removeAttr("disabled");
  // });

  $('#playPause').on('click', function(e) {
    wavesurfer.playPause();
  });

  // $('#loadButton').on('click', function() {
  //   wavesurfer.load($('#wave').data('url'));
  //   $(this).attr("disabled", true);
  //   $('#progress').show();
  //   $('#wave i').removeClass('fa-music');
  //   $('#wave i').addClass('fa-spinner fa-pulse');
  // });

}); // document.ready
