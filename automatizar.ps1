[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


Write-Host

Connect-PowerBIServiceAccount


#Areas de trabajo asignadas
$prueba2 = Get-PowerBIWorkspace -Scope Organization -User adminiamgwbi@madrid.onmicrosoft.com
#Area personal
$prueba2 = get-powerbiworkspace -Scope Organization -Name 'PersonalWorkspace adminiamgwbi'




$Arraynames = $prueba2.Name

$workspaceName = $Arraynames

$workspace = Get-PowerBIWorkspace -Scope Organization -Name $workspaceName

$dataset = Get-PowerBIDataset -Scope Organization -WorkspaceId $workspace.Id

$datasetId = $dataset.Id

$counter = 0
foreach($i in 0..($dataset.id).Length) {


 $datasetId_posicion = "6ef488ca-f762-4b6f-809a-de7f289c76c6"

 $datasource = Get-PowerBIDatasource -DatasetId $dataset.Id[$i]
 $gatewayId = $datasource.gatewayId
 $datasourceId = $datasource.datasourceId

 $workspaceId = "71c0be9a-8a1d-4be4-b6c4-a26c9ed82ef7"

  $datasourceUrl = "groups/$workspaceId/datasets/$datasetId_posicion/datasources"

  # POST body 
     $postParams = @{
     "gatewayObjectId" = "93153ed3-9bd4-4b40-9a78-eadc854705c7"
                
       }
  
  $jsonPostBody = $postParams | ConvertTo-JSON

   $gatewayPatchUrl = "groups/71c0be9a-8a1d-4be4-b6c4-a26c9ed82ef7/datasets/6ef488ca-f762-4b6f-809a-de7f289c76c6/Default.BindToGateway"
   Invoke-PowerBIRestMethod -Method Post -url $gatewayPatchUrl -Body $jsonPostBody -Verbose

   }




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
$array1[1]


Get-powerbidataset -scope Organization -WorkspaceId $array1[5][3].guid

Get-PowerBIDatasource -Scope Organization -DatasetId $array1[5][5].guid



$workspace = Get-PowerBIWorkspace -Scope Organization -Name $workspaceName

$dataset = Get-PowerBIDataset -Scope Organization -WorkspaceId $workspace.Id

$datasetId = $array1[5][5].Guid


foreach($i in 0..($datasetId).Length) {


 $datasetId_posicion = $datasetId[$i]

 $datasource = Get-PowerBIDatasource -DatasetId $datasetId[$i]
 $gatewayId = $datasource.gatewayId
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

   Invoke-PowerBIRestMethod  -Method Get -url https://api.powerbi.com/v1.0/myorg/admin/dataflows/ae8c447e-7efa-4a85-a18f-fd73b3fe4e9c/export | Out-File -FilePath .\dataflowprueba.json -Append

   Invoke-PowerBIRestMethod  -Method Get -url https://api.powerbi.com/v1.0/myorg/admin/groups/80ee77d3-50f1-429e-8e44-750bc22eab1e/datasets -Verbose

   Invoke-PowerBIRestMethod  -Method Get -url https://api.powerbi.com/v1.0/myorg/reports
   Invoke-PowerBIRestMethod  -Method Get -url https://api.powerbi.com/v1.0/myorg/reports/1f0eb029-5d1b-44a1-9091-1ad09fc2e61e/Export | Out-File -FilePath .\reportprueba.pbix

   $body= @{
  
  "value" = "--ae8c447e-7efa-4a85-a18f-fd73b3fe4e9c Content-Disposition: form-data name=reportprueba.pbix; filename=reportprueba.pbix Content-Type: multipart/form-data --ae8c447e-7efa-4a85-a18f-fd73b3fe4e9c--"
}

   
   Invoke-PowerBIRestMethod  -Method Post -url https://api.powerbi.com/v1.0/myorg/imports?datasetDisplayName=reportprueba.pbix -Body $body -Verbose
  
   Invoke-PowerBIRestMethod  -Method Post -url https://api.powerbi.com/v1.0/myorg/imports/createTemporaryUploadLocation


   # update script with file path to PBIX file
$pbixFilePath = "C:\Users\rvilchef\reportprueba.pbix"

$import = New-PowerBIReport -Path $pbixFilePath -WorkspaceId c0fe8204-e631-4c00-9276-6518e83fab7d -ConflictAction CreateOrOverwrite
Resolve-PowerBIError -Last
$import | select *

Invoke-PowerBIRestMethod -Method Post -url https://api.powerbi.com/v1.0/myorg/datasets?defaultRetentionPolicy=basicFIFO

$body = 
{
  "name": "SalesMarketing",
  "defaultMode": "Push",
  "tables": [
    {
      "name": "Product",
      "columns": [
        {
          "name": "ProductID",
          "dataType": "Int64"
        },
        {
          "name": "Name",
          "dataType": "string"
        },
        {
          "name": "Category",
          "dataType": "string"
        },
        {
          "name": "IsCompete",
          "dataType": "bool"
        },
        {
          "name": "ManufacturedOn",
          "dataType": "DateTime"
        },
        {
          "name": "Sales",
          "dataType": "Int64",
          "formatString": "Currency"
        }
      ]
    }
  ]
}







# Parameters - fill these in before running the script!
# =====================================================

$groupId = "71c0be9a-8a1d-4be4-b6c4-a26c9ed82ef7"           # the ID of the group (workspace) that hosts the dataset.
$datasetId = "6ef488ca-f762-4b6f-809a-de7f289c76c6"         # the ID of dataset to rebind

# End Parameters =======================================



# Make the request to bind to a gateway
$uri = "groups/$groupId/datasets/$datasetId/Default.TakeOver"

# Try to bind to a new gateway
try { 
    Invoke-PowerBIRestMethod -Url $uri -Method Post

    # Show error if we had a non-terminating error which catch won't catch
    if (-Not $?)
    {
        $errmsg = Resolve-PowerBIError -Last
        $errmsg.Message
    }
} catch {

    $errmsg = Resolve-PowerBIError -Last
    $errmsg.Message
}



 $trabajos = Get-PowerBIWorkspace -Scope Organization -All -Include dataflows
 $trabajos = Get-PowerBIWorkspace -Scope Organization -Type Workspace -First 2000 -Include dataflows


 $gatewaypre = "93153ed3-9bd4-4b40-9a78-eadc854705c7"
 $gatewaypro = "fd6dcb5d-deb9-4cb7-9806-58dc8be6fa8f"


 #$trabajos | Sort-Object Name    |format-table Id, Name | Out-File -FilePath .\workspaces_todos.txt 
 $trabajos.Dataflows | Sort-Object Name    |format-table Id, Name 
 $trabajos.Datasets | Sort-Object Name    |format-table Id, Name
 $trabajos | Sort-Object Name    | format-table Id, Name, Dataflows | Where-Object { $_.Dataflows -ne $null } 
 $h = $trabajos | Where-Object { $_.Dataflows -ne $null } 
 
 $h | Sort-Object Name    | format-table Id, Name, Dataflows | Out-File -FilePath .\workspaces_con_dataflows.txt


 $trabajos.Length #1514 espacios de trabajo
 $id_workspace_con_dataflow = 0..($trabajos).Length

$array0 = 0..(($h.Id).Length -1)


foreach ($i in 0..($h.Id.length -1)  ){
        "Loop = $i"
        #$trabajos.id[$i]
        $dataflow_id = Get-PowerBIDataflow -scope Organization -WorkspaceId  $h.id[$i]
       # $dataset_id.Length
        $a = 0..($dataflow_id.Length - 1)
       foreach ($j in 0..($dataflow_id.Length - 1)) {
        $conexion = Get-PowerBIDataflowDatasource -Scope Organization -DataflowId $dataflow_id[$j].id | select GatewayId
       if ($conexion.GatewayId -eq $gatewaypro){
       
        #$conexion = Get-PowerBIDatasource -Scope Organization -DatasetId $dataset_id[$j].id 
        
        $a[$j] = $dataflow_id[$j].Id
       # $array0[$i] = $trabajos.id[$i], "ids del workspace",$datasets_id
        Write-Output "Exito."
        }
        else{
        #Write-Output "Otro Gateway diferente."
        $a[$j] = $Null
        }

        }
        $array0[$i] = $h.id[$i],$h.name[$i], "ids del workspace",$a
        }




$array1 = 0..($array0.Length - 1)
foreach ($i in 0..($array0.Length - 1)) {
"

"
$array0[$i][0]
"
Dataflows del workspace"       
 if($array0[$i][2] -ne $Null){
    $array1[$i] = "Indice",$i,"      ",$array0[$i][0],$array0[$i][1], "Dataflows del workspace", $array0[$i][3]
 }else{
 "falso"
 $array1[$i] = $Null
 }
}

$b = 0..($array1.Length - 1)
foreach ($i in 0..($array1.Length - 1)) {
if($array0[$i][3] -ne $Null){
$b[$i] = "Indice", $i, "           ",$array1[$i][4] ,$array1[$i][3]
}else{
$b[$i] = $Null
}
}

$b


 








