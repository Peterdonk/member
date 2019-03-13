/* Add here all your JS customizations */

$(document).ready(function () {
   $("#buttons_holder").hide();
   $('#edit_button').click(function () {
      $("#fullName").removeAttr('readonly');
      $("#phoneNumber").removeAttr('readonly');
      $("#eMail").removeAttr('readonly');
      $("#digitalAddress").removeAttr('readonly');
      $("#service").removeAttr('readonly');
      $("#username").removeAttr('readonly');
      $("#buttons_holder").show();
      $(this).hide();
   });

   $("#btn_cancel_update").click(function () {
      $("#fullName").attr('readonly', 'readonly');
      $("#phoneNumber").attr('readonly', 'readonly');
      $("#eMail").attr('readonly', 'readonly');
      $("#digitalAddress").attr('readonly', 'readonly');
      $("#service").attr('readonly', 'readonly');
      $("#username").attr('readonly', 'readonly');
      $("#buttons_holder").hide();
      $("#edit_button").show();
   });


})


	

