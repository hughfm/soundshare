$(document).ready(function() {
  $(document).on("upload:start", "form", function(e) {
    $(this).find("input[type=submit]").attr("disabled", true);
  });

  $(document).on("upload:progress", "form", function(e) {
    detail = e.originalEvent.detail;
    percentComplete = Math.round(detail.progress.loaded / detail.progress.total * 100);
    $("progress").val(percentComplete);
  });

  $(document).on("upload:complete", "form", function(e) {
    if(!$(this).find("input.uploading").length) {
      $(this).find("input[type=submit]").removeAttr("disabled");
    }
  });

  var fileInput = $('#sound_audio');

  fileInput.on('change', function(event) {
    if (event.target.files.length) {
      wavesurfer.loadBlob(event.target.files[0]);
    } else {
      wavesurfer.fireEvent('error', 'Not a file');
    }
  });

}); // document.ready
