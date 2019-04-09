    $(document).ready(function(){

        $("#add-row").click(function(){
            var markup = "<tr><td><input type='text' name='' class='form-control' placeholder='Description'></td><td><input type='text' class='form-control' placeholder='Amount' ></td><td><input class='del btn btn-danger btn-md' type='button' value='Delete' /></td></tr>";
            $("#tbl_invoice").append(markup);

            $(".del").bind("click", Delete);
        });

        function Delete(){
        $(this).parent().parent().remove();
        }

      

        });