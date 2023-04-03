const form = document.getElementById('createacc');
const first_name = document.getElementById('fname');
const last_name = document.getElementById('lname');
const email = document.getElementById('email');
const password = document.getElementById('password');
const cpassword = document.getElementById('cpassword');





form.addEventListener("submit",function(e){
 
    
   let valid =  validateInputs();
   if(valid==0){
	console.log(valid);
    e.preventDefault();
   } 
   
});




const setError = (element,message) => {
	element.setAttribute('placeholder',message);
};

const setSuccess = element=>{
	element.setAttribute('placeholder','');
};

const validateInputs=()=>{
	const fname = first_name.value.trim();
	const lname = last_name.value.trim();
	const emailValue = email.value.trim();
	const passswordValue = password.value.trim();
	const cpasswordValue = cpassword.value.trim();
	
	
	if(fname === '' || lname === ''|| emailValue === '' || passswordValue==''|| cpasswordValue===''){
		setError(first_name,'field is required');
		setError(last_name,'field is required');
		setError(email,'field is required');
		setError(password,'field is required');
		setError(cpassword,'field is required');
		 alert("empty fields");
		 return 0;
	}
	
	else{
		return 1;
	}
};
