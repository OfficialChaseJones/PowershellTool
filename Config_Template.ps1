#      To add an option to PS_Tools
#           1)Save this script as Config_[your tool name].[ps1]
#           2)Edit the script below where you see the tag [EDIT THIS]
#
#
$NewToolOption = New-Object ToolOption


#Specify a name  and description
$NewToolOption.Name = "Your Tool Name"#[EDIT THIS]
$NewToolOption.Description = "Add a Description here to explain what your command will do."

$Params = @()


#Specify the parameters
#[EDIT THIS]
$Params+= New-Object ToolParameter
$Params[0].Name = "param1"
$Params+= New-Object ToolParameter
$Params[1].Name = "param2"


$NewToolOption.Parameters = $Params

#[EDIT THIS] - You MUST create a unique function name for each tool
$NewToolOption.function = "TemplateFunction"

#[EDIT THIS] - Add your logic here
Function TemplateFunction($ParameterHash)
{
    #The parameter passed in is a HashTable. You must retrieve parameters like this:$ParameterHash["name of your parameter"]

    Write-Host "This Function was Called"
    Write-Host $ParameterHash["param1"]
    Write-Host $ParameterHash["param2"]

    #The returned string will be displayed in the GUI
    return "Command Completed"
}


$ToolOptions+=$NewToolOption







