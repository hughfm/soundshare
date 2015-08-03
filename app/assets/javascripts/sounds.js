// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {
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

});
