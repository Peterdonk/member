/* Add here all your JS customizations */

$(document).ready(function () {

  if(window.location.href.indexOf("account-details") != -1){


   $("#buttons_holder").hide();
   $('#edit_button').click(function () {
      $("#fullName").removeAttr('readonly');
      $("#phoneNumber").removeAttr('readonly');
      $("#eMail").removeAttr('readonly');
      $("#digitalAddress").removeAttr('readonly');
      $("#contact_telephone").removeAttr('readonly');
      $("#contact_person").removeAttr('readonly');
      $("#buttons_holder").show();
      $(this).hide();
    
     

   });

   $("#btn_cancel_update").click(function () {
      $("#fullName").attr('readonly', 'readonly');
      $("#phoneNumber").attr('readonly', 'readonly');
      $("#eMail").attr('readonly', 'readonly');
      $("#digitalAddress").attr('readonly', 'readonly');
       $("#contact_telephone").attr('readonly', 'readonly');
      $("#contact_person").attr('readonly', 'readonly');
      $("#service").attr('readonly', 'readonly');
      $("#username").attr('readonly', 'readonly');
      $("#buttons_holder").hide();
      $("#edit_button").show();
   });


   $("#update_details_form").submit(function(e){

    e.preventDefault();
      var get_id = $("#txt_u_id").val();
      var get_url = "/client/account-details";

      var formValues = $(this).serialize();

      $.ajax({
         method: 'POST',
         url: get_url,
         data: formValues,
         success: successFunction,
         error: errorFunction
      });
 
    function successFunction(data){
       $("#fullName").attr('readonly', 'readonly');
      $("#phoneNumber").attr('readonly', 'readonly');
      $("#eMail").attr('readonly', 'readonly');
      $("#digitalAddress").attr('readonly', 'readonly');
       $("#contact_telephone").attr('readonly', 'readonly');
      $("#contact_person").attr('readonly', 'readonly');
      $("#service").attr('readonly', 'readonly');
      $("#username").attr('readonly', 'readonly');
      $("#buttons_holder").hide();
      $("#edit_button").show();

        iziToast.success({
          title: 'Success',
          position: 'topRight',
          message: 'Updated Successfully',
      });   
      }


    function errorFunction(data){
        iziToast.error({
    title: 'Error',
    message: 'Something went wrong',
});
      }  
   })

 }else{}


   if(window.location.href.indexOf("tickets") != -1){
     var random_number = "";
      var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      for (var i = 0; i < 6; i++){
        random_number += possible.charAt(Math.floor(Math.random() * possible.length));
      }
      $("#txt_ticketID").val("M-"+random_number);
      var ticket_id = $("#txt_ticketID").val()
      $("#ticketID").val(ticket_id);
      
      $("#add_ticket_form").submit(function(e){
     
      e.preventDefault();
      var get_url = "/client/service-tickets";


      var formValues = $(this).serialize();

      $.ajax({
         method: 'POST',
         url: get_url,
         data: formValues,
         success: successFunction,
         error: errorFunction
      });

       function successFunction(data){
        iziToast.success({
          title: 'Success',
          position: 'topRight',
          message: 'Updated Successfully',
      });  

      }


    function errorFunction(data){
        iziToast.error({
    title: 'Error',
    message: 'Something went wrong',
});
      }  

    });

   }else{}


})


	

