<?php  
session_start();
//$conn=mysqli_connect('localhost','root','','srl_tool') or die (mysqli_error());
 //connexion
 $db = new PDO('mysql:host=localhost;dbname=oaa','root','') or die('could not connect to database');

$NOM=$_POST['nom'];
$PRE=$_POST['pre'];
$EML=$_POST['eml'];
$PWD=($_POST['pwd']);

if(isset($_POST['submit'])){
   //requete 
   $sql = "SELECT * FROM apprenant where  email = '$EML'";
   $result = $db->prepare($sql);
   $result->execute();
   //test
   if($result->rowcount() > 0)
   {
      
      header('Location: ../html/nouveauC.php?erreur=1'); // Compte existait déjà !
   }
   else
   {
      if(!empty($NOM) && !empty($PRE) && !empty($EML) && !empty($PWD)){
        //$PWD=password_hash($PWD, PASSWORD_DEFAULT);
        $req="INSERT INtO apprenant (nomApprenant, prenomApprenant, email, mot_de_passe) VALUES ('$NOM', '$PRE', '$EML', '$PWD')";
        $res=$db->prepare($req);
        $res->execute();
        $_SESSION['nom'] = $NOM;
        $_SESSION['pre'] = $PRE;
        $_SESSION['eml'] = $EML;
        header("Location: ../html/accueil.php?afficher=0");
        

        //echo"enregistrement effectué";

      }
      else
      {
       
        header('Location: ../html/nouveauC.php?erreur=2'); // Tous les champs doivent être complétés !
      }
    }   
     }
     



?>
