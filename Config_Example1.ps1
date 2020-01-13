#      To add an option to PS_Tools
#           1)Save this script as Config_[your tool name].[ps1]
#           2)Edit the script below where you see the tag [EDIT THIS]
#
#
$NewToolOption = New-Object ToolOption


#Specify a name
$NewToolOption.Name = "Example 1"#[EDIT THIS]
$NewToolOption.Description = "This example shows an alert message with text input by the user."


$Params = @()


#Specify the parameters
#[EDIT THIS]
$Params+= New-Object ToolParameter
$Params[0].Name = "Alert Box Message"


$NewToolOption.Parameters = $Params

#[EDIT THIS] - You MUST create a unique function name for each tool
$NewToolOption.function = "ExampleFunction"

#[EDIT THIS] - Add your logic here
Function ExampleFunction($ParameterHash)
{
    #The parameter passed in is a HashTable. You must retrieve parameters like this:$ParameterHash["name of your parameter"]

    Write-Host "This is a simple example"
    [System.Windows.MessageBox]::Show($ParameterHash["Alert Box Message"])

    #The returned string will be displayed in the GUI
    return "Command Completed"
}


$ToolOptions+=$NewToolOption







