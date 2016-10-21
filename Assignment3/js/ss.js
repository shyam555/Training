
function validateForm()
    {
        

        var x=document.myForm.email.value;  
        var atposition=x.indexOf("@");  
        var dotposition=x.lastIndexOf(".");
        /*var letters = /^[0-9a-zA-Z]+$/;*/
        var pcon =  /(?=.*[0-9])(?=.*[a-z])/;
        var mailid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var genderM = document.getElementById('residence1').checked;
        var genderF = document.getElementById('residence2').checked;
        var intr1 = document.getElementById('checkbox_sample18').checked;
        var intr2 = document.getElementById('checkbox_sample19').checked;
        var intr3 = document.getElementById('checkbox_sample20').checked;

       if (document.myForm.firstname.value==null || document.myForm.firstname.value==""){
            alert("Please Enter the first name");
            document.myForm.firstname.focus(); 

            return false;
         }else if (document.myForm.lastname.value==null || document.myForm.lastname.value==""){
            alert("Please Enter the last name");
            document.myForm.lastname.focus();

            return false;
         }else if (document.myForm.phone.value==null || document.myForm.phone.value==""){
            
              alert("Please Enter the phone number");
              document.myForm.phone.focus();

              return false;
         }else if(isNaN(document.myForm.phone.value)==true){

              alert("Plz Enter correct mob number");
              document.myForm.phone.focus();

              return false;
         }else if(document.myForm.phone.value.length < 10 || document.myForm.phone.value.length > 10){

              alert("Plz Enter exact 10 digit mobile number");
              document.myForm.phone.focus();

              return false;
         }else if (document.myForm.office.value==null || document.myForm.office.value==""){
            
              alert("Please Enter the office number");
              document.myForm.office.focus();

              return false;
         }else if(isNaN(document.myForm.office.value)==true){

              alert("Plz Enter office number in digit format");
              document.myForm.office.focus();

              return false;
         }else if (document.myForm.email.value==null || document.myForm.email.value==""){
            
              alert("Please Enter the email Id");
              document.myForm.email.focus();

              return false;
         }/*else if(atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
          
              alert("Please enter a valid e-mail address");  
              document.myForm.email.focus();
              return false;  
          }*/
          else if(!mailid.test(document.myForm.email.value)){  
          
              alert("Please enter a valid e-mail address");  
              document.myForm.email.focus();
              return false;  
          }else if (document.myForm.password1.value==null || document.myForm.password1.value==""){
            
              alert("Please Enter the password");
              document.myForm.password1.focus();

              return false;

         }else if((document.myForm.password1.value.length < 8) || (document.myForm.password1.value.length > 12) ){

            alert("Password Range should be between 8 to 12 characher");
            document.myForm.password1.focus();
            return false;
         }else if(!pcon.test(document.myForm.password1.value)){

            alert("should accept only Alphanumeric characters, No Special characters");
            document.myForm.password1.focus();
            return false;
         }else if(document.myForm.password2.value==null || document.myForm.password2.value==""){

            alert("Please Confirm the password");
            document.myForm.password2.focus();

            return false;
         }else if (document.myForm.password1.value != document.myForm.password2.value){

            alert("Please enter exact password");
            document.myForm.password2.focus();

            return false;
         }else if (genderM==false&&genderF==false){
            alert("Please seclect the gender.");
          
            return false;
         }else if (intr1 == false && intr2==false && intr3==false){
            alert("Please Select the interest");
            
            return false;
         }if (document.myForm.txtarea.value==null || document.myForm.txtarea.value==""){
            alert("Please write something about you");
            document.myForm.txtarea.focus(); 

            return false;
         }else 
            return true;    
}


function display()
{
      var bmon = document.myForm.month.value;
      var bday = document.myForm.day.value;
      var byear = document.myForm.year.value;

      var to_date = new Date();
      var to_year = to_date.getFullYear();
      var to_month = to_date.getMonth();
      var to_day = to_date.getDate();

      var display_year = to_year - byear;
      var display_month = to_month - bmon;
      var display_age = display_year + display_month * 0.083;

       alert("Please enter a valid e-mail address \n bmon"+bmon+"\n display_year"+display_year);  
      document.getElementById('demo123').value = display_age;
}