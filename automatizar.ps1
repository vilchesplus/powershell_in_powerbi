[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


Write-Host

Connect-PowerBIServiceAccount




$trabajos = Get-PowerBIWorkspace -Scope Organization -First 2000 -Include Datasets
$trabajos.Length 

($trabajos.Datasets).Length
$trabajos.Id
#(($trabajos.Datasets).Id).Length
#($trabajos.Id).Length 



$array0 = 0..(($trabajos.Id).Length -1)
foreach ($i in 0..(($trabajos.Id).Length -1)  ){
        "Loop = $i"
        $trabajos.id[$i]
        $dataset_id = Get-powerbidataset -scope Organization -WorkspaceId  $trabajos.id[$i]
        $dataset_id.Length
        $a = 0..($dataset_id.Length - 1)
       foreach ($j in 0..($dataset_id.Length - 1)) {
        $conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id | select GatewayId
       if ($conexion.GatewayId -eq "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"){
       
        #$conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id 
        
        $a[$j] = $dataset_id[$j].Id
       # $array0[$i] = $trabajos.id[$i], "ids del workspace",$datasets_id
        Write-Output "Exito."
        }
        else{
        #Write-Output "Otro Gateway diferente."
        $a[$j] = $Null
        }

        }
        $array0[$i] = $trabajos.id[$i], "ids del workspace",$a
        }

$array0
$array0.Length
$array0[0..50][0]


$array1 = 0..($array0.Length - 1)
foreach ($i in 0..($array0.Length - 1)) {
"

"
$array0[$i][0]
"
Datasets del workspace"       
 if($array0[$i][2] -ne $Null){
    $array1[$i] = "Indice",$i,"      ",$array0[$i][0], "Datasets del workspace", $array0[$i][2]
 }else{
 "falso"
 $array1[$i] = $Null
 }
}

$array1

$b = 0..($array1.Length - 1)
foreach ($i in 0..($array1.Length - 1)) {
if($array0[$i][2] -ne $Null){
$b[$i] = "Indice", $i, "           ", $array1[$i][3]
}else{
$b[$i] = $Null
}
}



$b.guid #Espacios de trabajo que utilizan de alguna manera el gateway.
$array1 #Dichos espacios de trabajo y sus datasets.

$array1[5][5].guid[0] #Primer dataset del primer espacio de trabajo que tenemos.
$array1[5]


Get-powerbidataset -scope Organization -WorkspaceId $array1[5][3].guid

Get-PowerBIDatasource -Scope Organization -DatasetId $array1[5][5].guid[0]
Get-PowerBIDatasource -Scope Organization -DatasetId 1babee66-2198-465b-95cb-17c05759f8f4


Get-powerbidataset -scope Organization -WorkspaceId 464ada52-46bb-4f8e-84f1-0b0a653744fb




$workspace = Get-PowerBIWorkspace -Scope Organization -Name $workspaceName

$dataset = Get-PowerBIDataset -Scope Organization -WorkspaceId $workspace.Id

$datasetId = $array1[5][5].Guid


#foreach($i in 0..($datasetId.Length -1)) {

#$c = 0..($datasetId.Length - 1)
 
 #$a = Get-PowerBIDatasource  -Scope Organization  -DatasetId $datasetId[$i]
#foreach($j in 0..($a.Length - 1)) {
 #   if ($a[$j].GatewayId -eq "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"){
  #  "Cumple"
   # $a[$j]
    #}else{
    #"No cumple"
    #$a[$j]}
    

#}
#}


foreach($i in 0..($datasetId).Length) {


 $datasetId_posicion = $datasetId[$i]

 $datasource = Get-PowerBIDatasource -scope Organization -DatasetId 1babee66-2198-465b-95cb-17c05759f8f4
 $gatewayId = $datasource.gatewayId -eq "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"
 $datasourceId = $datasource.datasourceId

 $workspaceId = $array1[5][3].Guid

  $datasourceUrl = "groups/$workspaceId/datasets/$datasetId_posicion/datasources"

  # POST body 
     $postParams = @{
     "gatewayObjectId" = "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"
                
       }
  
  $jsonPostBody = $postParams | ConvertTo-JSON

   $gatewayPatchUrl = "groups/$workspaceId/datasets/$datasetId_posicion/Default.BindToGateway"
   Invoke-PowerBIRestMethod -Method Post -url $gatewayPatchUrl -Body $jsonPostBody -Verbose

   }


####################################################################################################################################################


$gatewaypre = "93153ed3-9bd4-4b40-9a78-eadc854705c7"
$gatewaypro = "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"

 Get-PowerBIWorkspace -Scope Organization -User adminiamgwbi@madrid.onmicrosoft.com
 

 $trabajos = Get-PowerBIWorkspace -Scope Organization -All -Include Datasets, dataflows
 Get-PowerBIWorkspace -scope Organization -Include Dataflows -Filter '84b219d2-d595-4906-b8b7-69ec91497f9e'
 (Get-PowerBIWorkspace -scope Organization -Id     '79049ac4-aabd-4f6c-aa9d-fffc0595fa9a' -Include Dataflows).Dataflows

($trabajos.Dataflows).Id -contains '84b219d2-d595-4906-b8b7-69ec91497f9e'
($trabajos.Dataflows).Id -contains  'cfacf66e-1efa-43c5-95c0-4a54cd4f217b'

0..((($trabajos.Dataflows).Id).Count - 1) | Where { (($trabajos.Dataflows).Id)[$_] -eq '84b219d2-d595-4906-b8b7-69ec91497f9e' }    
0..((($trabajos.Dataflows).Id).Count - 1) | Where { (($trabajos.Dataflows).Id)[$_] -eq 'cfacf66e-1efa-43c5-95c0-4a54cd4f217b' } #54bb59cb-1a2c-4f6b-ac59-90afb08ae7fd
0..((($trabajos.Dataflows).Id).Count - 1) | Where { (($trabajos.Dataflows).Id)[$_] -eq '953bfcf8-4462-44e4-ba04-6e2b3ee5f813' } #1aa78f8b-5378-48b1-8eab-69cc7129fe98
 

0..((($trabajos.Dataflows).Name).Count - 1) | Where { (($trabajos.Dataflows).Name)[$_] -eq '****************' }  




 $trabajos | Sort-Object Name    |format-list  | Out-File -FilePath .\workspaces_todos4.txt 

 $trabajos | Out-File -FilePath .\workspaces_todos2.txt 

 $trabajos.Dataflows | Sort-Object Name    |format-table Id, Name 
 $trabajos.Datasets | Sort-Object Name    |format-table Id, Name

 
 $trabajos.Length #1514 espacios de trabajo

 #$trabajos.id -like '80ee77d3-50f1-429e-8e44-750bc22eab1e'


 $array0 = 0..(($trabajos.Id).Length -1)


foreach ($i in 0..($trabajos.Id.length -1)  ){
        "Loop = $i"
        #$trabajos.id[$i]
        $dataset_id = Get-powerbidataset -scope Organization -WorkspaceId  $trabajos.id[$i]
       # $dataset_id.Length
        $a = 0..($dataset_id.Length - 1)
       foreach ($j in 0..($dataset_id.Length - 1)) {
        $conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id | select GatewayId
       if ($conexion.GatewayId -eq $gatewaypro){
       
        #$conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id 
        
        $a[$j] = $dataset_id[$j].Id
       # $array0[$i] = $trabajos.id[$i], "ids del workspace",$datasets_id
        Write-Output "Exito."
        }
        else{
        #Write-Output "Otro Gateway diferente."
        $a[$j] = $Null
        }

        }
        $array0[$i] = $trabajos.id[$i], "ids del workspace",$a
        }


$array0 | Out-File -FilePath .\array0.txt

$array0.Length
$array0[0][0]
$array0.guid.Length
[array]::indexof($array0.guid,'80ee77d3-50f1-429e-8e44-750bc22eab1e')


#En el siguiente bucle lo que se busca es aislar los valores null de los que contienen valor, y extraer así información útil que necesitamos.

$array1 = 0..($array0.Length - 1)
foreach ($i in 0..($array0.Length - 1)) {
"

"
$array0[$i][0]
"
Datasets del workspace"       
 if($array0[$i][2] -ne $Null){
    $array1[$i] = "Indice",$i,"      ",$array0[$i][0], "Datasets del workspace", $array0[$i][2]
 }else{
 "falso"
 $array1[$i] = $Null
 }
}

$array1 #Dichos espacios de trabajo y sus datasets. #Si se hace un $array1.Length vemos que aparecen 1507, pero no aparecen porque están como NULL.
$array1[844][5].guid[0] #Primer dataset del primer espacio de trabajo que tenemos.

#Bucle para obtener los id de workspaces que utilizan de alguna manera el gateway.
$b = 0..($array1.Length - 1)
foreach ($i in 0..($array1.Length - 1)) {
if($array0[$i][2] -ne $Null){
$b[$i] = "Indice", $i, "           ", $array1[$i][3]
}else{
$b[$i] = $Null
}
}

$b.guid #Espacios de trabajo que utilizan de alguna manera el gateway.

$c = 0..($b.guid.Length - 1)
foreach ($i in 0..($b.guid.Length - 1)) {
$c[$i] = (Get-PowerBIWorkspace -Scope Organization -Id $b.guid[$i]).name
}
$c #nombres de los workspaces



$workspace = Get-PowerBIWorkspace -Scope Organization -Id $b.guid[2]
$dataset = (Get-PowerBIDataset -Scope Organization -WorkspaceId $b.guid[0]).name
$datasetid = $dataset.id
$datasource = Get-PowerBIDatasource -scope Organization -DatasetId $datasetid.guid[2]


(Get-PowerBIDataset -Scope Organization -WorkspaceId $b.guid[-1]) -ne $Null



foreach ($i in 0..($b.guid.Length - 1)) {
$dataset = (Get-PowerBIDataset -Scope Organization -WorkspaceId $b.guid[$i])
if ($dataset -ne $Null) {

"        ","Id del workspace",$b.guid[$i],"    ","Nombre del workspace",$c[$i],"   ", "Ids de los datasets de dicho workspace",$dataset | Format-Table name, id | Out-File -FilePath .\completo_sin_nulls.txt -Append
} else{
"no cumple"
}
}



$espacios_trabajo = 0..($b.guid).Length
foreach ($i in 0..($b.guid.Length - 1)) {
 Get-PowerBIWorkspace -Scope Organization -Id $b.guid[$i]
}

#Bucle para checkear los datasources de los datasets y ver el gateway que utilizan.


 $probando = 0..($datasetid.Length )

foreach($i in 0..($datasetid.Length )) {

#$c = 0..($dataseid.Length - 1)
 
 $d = Get-PowerBIDatasource  -Scope Organization  -DatasetId $datasetid[$i]
 $cumple_datasource_gateway = 0..($d.Length )
foreach($j in 0..($d.Length)) {
#$datasetid[$i]
    if ($d[$j].GatewayId -eq $gatewaypro){
    "Cumple"
    $cumple_datasource_gateway[$j] =  $d[$j]
   }else{
    "No cumple"
     $cumple_datasource_gateway[$j] =  $NULL
    
    
  }
   
}
$probando[$i] = $datasetid[$i], "   ", $cumple_datasource_gateway
}


#Nos interesa conocer de cada dataset contenido en un workspace, los datasources que utilizan el gateway:

$k = 0..($probando.Length - 1)

foreach ($i in 0..($probando.Length - 1) ){
if($probando[$i][2] -ne $Null){
$k[$i] = "Indice", $i, "           ", $probando[$i][0],$probando[$i][2]
}else{
$k[$i] = $Null
}
}

$k #Contiene id del dataset y el datasource en concreto que utiliza el gateway.



$b.guid


foreach($j in 0..(($b.guid).Length - 1) ){

$dataset = (Get-PowerBIDataset -Scope Organization -WorkspaceId $b.guid[$j])
$dataset.id
$datasetId = $dataset.id
$datasource = Get-PowerBIDatasource -scope Organization -DatasetId $datasetid


foreach($i in 0..(($datasetId).Length - 1) ){


 $datasetId_posicion = $datasetId[$i]

 $datasource = Get-PowerBIDatasource -scope Organization -DatasetId $datasetId[$i]

 
  if ($datasource.gatewayId -eq "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f") {

# $datasourceId = $datasource.datasourceId

 $workspaceId = $workspace.id

  $datasourceUrl = "groups/$workspaceId/datasets/$datasetId_posicion/datasources"

  # POST body 
     $postParams = @{
     "gatewayObjectId" = $gatewaypro
                
       }
  
  $jsonPostBody = $postParams | ConvertTo-JSON

   #MIRAR PARA LA URL.
    $sourceGroupsPath = ""
    if ($workspaceId -eq "me") {
    $sourceGroupsPath = "myorg"
}   else {
    $sourceGroupsPath = "myorg/groups/$workspaceId"
}



   $gatewayPatchUrl = "$sourceGroupsPath/datasets/$datasetId_posicion/Default.BindToGateway"
   Invoke-PowerBIRestMethod -Method Post -url $gatewayPatchUrl -Body $jsonPostBody -Verbose
    Resolve-PowerBIError -Last
   }

   $gatewayPatchUrl = "gateways/93153ed3-9bd4-4b40-9a78-eadc854705c7"
   https://api.powerbi.com/v1.0/myorg/gateways
   Invoke-PowerBIRestMethod -Method Get -url $gatewayPatchUrl  

}else{
Write-Output "No procede"
}
}



$datasourceUrl = "groups/80ee77d3-50f1-429e-8e44-750bc22eab1e/datasets/4dc4afac-3daf-45ba-b61d-7f5446c20624/datasources"

  # POST body 
     $postParams = @{
     "gatewayObjectId" = $gatewaypro
                
       }
  
  $jsonPostBody = $postParams | ConvertTo-JSON

   $gatewayPatchUrl = "groups/80ee77d3-50f1-429e-8e44-750bc22eab1e/datasets/4dc4afac-3daf-45ba-b61d-7f5446c20624/Default.BindToGateway"
   
   Invoke-PowerBIRestMethod -Method Post -url $gatewayPatchUrl -Body $jsonPostBody -Verbose
    Resolve-PowerBIError -Last






############################ Dataflows #################################################################
$dataflow = Get-PowerBIDataflow -Scope Organization | Format-table Id, Name 
$dataflow.Length #(106)

Get-PowerBIGatewayId -Scope Organization 
Get-PowerBIWorkspace -Scope Organization -Id 80ee77d3-50f1-429e-8e44-750bc22eab1e
(Get-powerbidataset -scope Organization -WorkspaceId  80ee77d3-50f1-429e-8e44-750bc22eab1e)
$y = Get-PowerBIDataflow -Scope Organization -WorkspaceId 80ee77d3-50f1-429e-8e44-750bc22eab1e
(Get-PowerBIDataflowDatasource -scope Organization -DataflowId  ae8c447e-7efa-4a85-a18f-fd73b3fe4e9c)

 $datasetId_posicion = '60e314f5-ac2c-4934-b1b9-b1753757e7d0'

 Get-PowerBIDataflowDatasource -scope Organization -DataflowId 84b219d2-d595-4906-b8b7-69ec91497f9e

           
 Get-PowerBIDataflowDatasource -scope Organization -DataflowId 31506062-2829-4f37-acf3-d91a19592257


 $comprobacion = 0..(($dataflow.Id).Length -1)
 $comprobacion.Length

foreach ($i in 0..(($dataflow).Length -1)  ){
        "Loop = $i"
        
        
       
        #$a = 0..($dataflow.Length - 1)
    
        $conexion = Get-PowerBIDataflowDatasource -scope Organization -DataflowId $dataflow.id[$i] | select GatewayId
       if ($conexion.GatewayId -like $gatewaypro){
       
        #$conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id 
        
        $a[$i] = $dataflow.id.guid[$i] + "     " + $dataflow.name[$i]
        Write-Output "Exito."
        }
        else{
        #Write-Output "Otro Gateway diferente."
        $a[$i] = $Null
        }
        $comprobacion[$i] = $a[$i]
        }
        
        

$comprobacion2 = 0..($comprobacion.Length - 1)
foreach ($i in 0..($comprobacion.Length - 1)) {
"

"
#$comprobacion[$i]
"
Datasets del workspace"       
 if($comprobacion[$i] -ne $Null){
    $comprobacion2[$i] = $comprobacion[$i]
 }else{
 "falso"
 $comprobacion2[$i] = $Null
 }
}

$comprobacion2.Length

$z = 0..($comprobacion2.Length - 1)
foreach ($i in 0..($comprobacion2.Length - 1)) {
if($comprobacion[$i] -ne $Null){
$z[$i] = "Indice", $i, "           ", $comprobacion2[$i] 
}else{
$z[$i] = $Null
}
}

($z.guid).Length


$z | Format-Table 

$z | Out-File -FilePath .\flujos.txt



foreach ($i in 0..($comprobacion2.Length - 1)) {


"ID y nombre del dataflow", "  ", $comprobacion2[$i] | Format-wide | Out-File -FilePath .\prueba.txt -Append

}

     











