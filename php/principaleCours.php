<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <div>
            <!-- tester si l'utilisateur est connecté -->
            <?php
                $req2="INSERT INtO objectif (descrip, idCours, idApprenant) VALUES (':descrip', ':idCours', '5')";
                $req="SELECT idCours from cours where nomCours = '$cours'";
                
                $rep = $db->query('SELECT idCours from cours where nomCours = '$cours'');
                var_dump($rep);
                $donnees = $rep->fetch();

                $res2=$db->prepare($req2);
                $res2->execute(
                  array(
                  'descrip'=> $dsc,
                  'idCours' => $donnees['idCours']
                  )
                );
            
            ?>
            
            
        </div>
    </body>
</html>