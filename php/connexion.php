<?php  

$conn=mysqli_connect('localhost','root','','srl_tool') or die (mysqli_error());

   $mailConnect =$_POST['mailconnect'];
   $mdpConnect = $_POST['mdpconnect'];

if (isset($_POST['formconnexion']))
 {
   if (!empty($mailconnect) AND !empty($mdpconnect)) 
   {
      
   	
   }
   else
   {
   	echo "tt les champs doivent être complétés";
   }
 }

?>
