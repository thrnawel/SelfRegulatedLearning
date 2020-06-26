<?php  

$conn=mysqli_connect('localhost','root','','srl_tool') or die (mysqli_error());


$NOM=$_POST['nom'];
$PRE=$_POST['pre'];
$EML=$_POST['eml'];
$PWD=($_POST['pwd']);

if(isset($_POST['submit'])){
      if(!empty($NOM) && !empty($PRE) && !empty($EML) && !empty($PWD)){
        $req="INSERT INTO apprenant (nomApprenant,prenomApprenant,email,mot_de_passe) VALUES ('$NOM','$PRE','$EML','$PWD')";

        $res=mysqli_query($conn,$req);

      }
      else
      {
        echo "Tous les champs doivent être complétés !"; 
      }
       
     }
    



?>
