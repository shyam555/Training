$(document).ready(function(){
	$('#submit_btn').click(function(){
    var aboutYou =  $('#tarea').val();
    var intrest1 = $("#checkbox_sample18:checked").length;
    var intrest2 = $("#checkbox_sample19:checked").length;
    var intrest3 = $("#checkbox_sample20:checked").length;
  	var firstName = $('#fname').val();
    var lastName = $('#lname').val();
  	var phoneNo = $('#phone').val();
    var officeNo = $('#office').val();
    var email = $('#emailid').val();
    var mailid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var password1 = $('#pass1').val();
    var password2 = $('#pass2').val();
    var pcon = /(?=.*[0-9])(?=.*[a-z])/;
    var dobYear = $('#year').val();
    var genderM = $('input[name=radio]:checked').val();
    var genderF = $('input[name=radio]:checked').val();
  	var nameRegex = /^[a-zA-Z]+$/;
  	var emailRegex = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    /*alert(""+intrest1);*/
  	if(firstName.length == 0 || firstName.length== null){
          $("#fname").focus();
          alert("Please Enter First name!");
      	  return false;
  	}else if(!nameRegex.test(firstName)){           
          alert("Please enter a valid first name( only characters)");  
          $("#fname").focus();
          return false;
    }
    else if(lastName.length == "" || lastName.length== null){
          $("#lname").focus();
          alert("Please Enter Last name!");
          return false;
    }else if(!nameRegex.test(lastName)){           
          alert("Please enter a valid last name( only characters)");  
          $("#lname").focus();
          return false;
    }else if(phoneNo.length == "" || phoneNo.length== null){
          $("#phone").focus();
          alert("Please Enter Mobile Number!");
          return false;
    }else if(isNaN(phoneNo)==true){
          $("#phone").focus();
          alert("Please Enter Correct Mobile Number!");
          return false;
    }else if(phoneNo.length < 10 || phoneNo.length > 10){
          $("#phone").focus();
          alert("Please Enter Exact 10 digit Mobile Number!");
          return false;
    }else if (officeNo.length == null || officeNo.length==""){           
          alert("Please Enter the office number");
          $("#office").focus();
          return false;
    }else if(isNaN(officeNo)==true){
          alert("Please Enter office number in digit format");
          $("#office").focus();
          return false;
    }else if (email.length == null || email.length == ""){           
          alert("Please Enter the email Id");
          $("#emailid").focus();
          return false;
    }else if(!mailid.test(email)){           
          alert("Please enter a valid e-mail address");  
          $("#emailid").focus();
          return false;
    }else if (password1.length == null || password1.length ==""){          
          alert("Please Enter the password");
          $("#pass1").focus();
          return false;
    }else if((password1.length < 8) || (password1.length > 12) ){
          alert("Password Range should be between 8 to 12 characher");
          $("#pass1").focus();
          return false;
    }else if(!pcon.test(password1)){
          alert("should accept only Alphanumeric characters, No Special characters");
          $("#pass1").focus();
          return false;
    }else if(password2 == null || password2 == ""){
          alert("Please Confirm the password");
          $("#pass2").focus();
          return false;
    }else if ( password1 != password2 ){
          alert("Please enter exact password");
          $("#pass2").focus();
          return false;
    }else if(isNaN(dobYear)==true){
          alert("Please select Date of birth");
          $("#year").focus();
          return false;
    }else if(!(genderM && genderF)){
          alert("Please select the gender.");
          return false;
    }else if(intrest1 == 0  && intrest2 == 0  && intrest3 == 0){
          alert("Please Select the interest");          
          return false;
    }else if(aboutYou.length == null || aboutYou.length == ""){
          alert("Please write something about you");
          $("#tarea").focus(); 
          return false;
    }else if(aboutYou.length < 8){
          alert("minimum 8 character.");
          $("#tarea").focus(); 
          return false;
    }else{
  		    alert("Form Submitted Successfuly!");
  		    return true;
    }
	});


  $("#year").change(function(){
      
      var bmon = $('#month').val();
      var bday = $('#day').val();
      var byear = $('#year').val();
      var to_date = new Date();
      var to_year = to_date.getFullYear();
      var to_month = to_date.getMonth();
      var to_day = to_date.getDate();

      var display_year = to_year - byear;
      var display_month = to_month - bmon;
      var display_age = display_year + ( display_month * 0.083 );
      
      document.getElementById('demo123').value = display_age;
    });

});