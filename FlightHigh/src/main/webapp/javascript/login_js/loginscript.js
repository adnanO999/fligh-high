const form = document.getElementById('loginacc');
const username = document.getElementById('username');
const password = document.getElementById('password');






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
	const uName = username.value.trim();
	const passswordValue = password.value.trim();

	
	if(uName === '' || passswordValue==''){
		
		setError(password,'field is required');
		setError(username,'field is required');
		 alert("empty fields");
		 return 0;
	}
	
	else{
		return 1;
	}
};
