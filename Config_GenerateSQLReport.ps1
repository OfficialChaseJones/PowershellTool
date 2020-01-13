#      To add an option to PS_Tools
#           1)Save this script as Config_[your tool name].[ps1]
#           2)Edit the script below where you see the tag [EDIT THIS]
#
#
$NewToolOption = New-Object ToolOption


#Specify a name
$NewToolOption.Name = "Generate SQL Report"#[EDIT THIS]
$NewToolOption.Description = "Connect to SQL Server, run a simple query, and output the results to CSV."


$Params = @()


#Specify the parameters
#[EDIT THIS]
$Params+= New-Object ToolParameter
$Params[0].Name = "Output Location"
$Params[0].DefaultValue = "D:\Report_Output.csv"
$Params+= New-Object ToolParameter
$Params[1].Name = "SQL Server"
$Params[1].DefaultValue = "localhost\SQLEXPRESS"


$NewToolOption.Parameters = $Params

#[EDIT THIS] - You MUST create a unique function name for each tool
$NewToolOption.function = "OutputSQLReport"

#[EDIT THIS] - Add your logic here
Function OutputSQLReport($ParameterHash)
{
    #The parameter passed in is a HashTable. You must retrieve parameters like this:$ParameterHash["name of your parameter"]
    $OutputLocation =  $ParameterHash["Output Location"]
    $SQLServer =  $ParameterHash["SQL Server"]

    #Simple query for demonstration purposes.
    $QueryResults = Invoke-Sqlcmd -Query "SELECT * From sys.databases" -ServerInstance $SQLServer

    $QueryResults | Export-Csv $OutputLocation

    return "Command Completed"
}


$ToolOptions+=$NewToolOption







