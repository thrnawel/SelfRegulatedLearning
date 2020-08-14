<?php  

//$conn=mysqli_connect('localhost','root','','srl_tool') or die (mysqli_error());
 //connexion
 $db = new PDO('mysql:host=localhost;dbname=srl_tool','root','') or die('could not connect to database');

$NOM=$_POST['nom'];
$PRE=$_POST['pre'];
$EML=$_POST['eml'];
$PWD=($_POST['pwd']);

if(isset($_POST['submit'])){
   //requete 
   $sql = "SELECT * FROM apprenant where nomApprenant ='$NOM' and prenomApprenant='$PRE' and  email = '$EML' or mot_de_passe='$PWD'";
   $result = $db->prepare($sql);
   $result->execute();
   //test
   if($result->rowcount() > 0)
   {
      echo " compte existait déjà ! ";
   }
   else
   {
      if(!empty($NOM) && !empty($PRE) && !empty($EML) && !empty($PWD)){
        //$PWD=password_hash($PWD, PASSWORD_DEFAULT);
        $req="INSERT INtO apprenant (nomApprenant, prenomApprenant, email, mot_de_passe) VALUES ('$NOM', '$PRE', '$EML', '$PWD')";
        $res=$db->prepare($req);
        $res->execute();
        header("Location:../html/accueil.html");
        //echo"enregistrement effectué";

      }
      else
      {
        echo "Tous les champs doivent être complétés !"; 
      }
    }   
     }
    



?>
