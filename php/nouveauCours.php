<?php  
session_start();
//connexion
 $db = new PDO('mysql:host=localhost;dbname=oaa','root','') or die('could not connect to database');

$plateforme=$_POST['plateforme'];
$cours=$_POST['cours'];
$id=$_POST['id'].
$dsc=$_POST['dscrp'];


if(isset($_POST['submit'])){
   //requete 
   $sql = "SELECT * FROM cours where  plateforme_url='$plateforme' and nomCours ='$cours' and id_apprenant_plateforme='$id'";
   $result = $db->prepare($sql);
   $result->execute();
   //test
   if($result->rowcount() > 0)
   {
      header('Location: ../html/nouveauCours.php?error=1'); // cours deja enregistré
   }
   else
   {
      if( !empty($plateforme) && !empty($cours) && !empty($id) && !empty($dsc)){

        $req1="INSERT INtO cours (plateforme_url, nomCours, id_apprenant_plateforme) VALUES ('$plateforme', '$cours',  '$id')";
        $req2="INSERT INtO objectif (descrip, idCours, idApprenant) VALUES (':descrip', ':idCours', '5')";
       // $req="SELECT idCours from cours where nomCours = '$cours'";
        
       
    
        $res1=$db->prepare($req1);
        $res1->execute();
         
        $cours = $_SESSION['cours'] ;
         $rep = $db->query("SELECT idCours from cours where nomCours = '$cours'");
        var_dump($rep);
        $donnees = $rep->fetch();

        //$res=$db->prepare($req);
        //$res->execute();

        $res2=$db->prepare($req2);
        $res2->execute(
          array(
          'descrip'=> $dsc,
          'idCours' => $donnees['idCours']
          )
        );
    
        header("Location:../html/accueil.php");
      }
      else
      {
        header('Location: ../html/nouveauCours.php?error=2'); // Tous les champs doivent être complétés !
      }
    }   
     }
     



?>

