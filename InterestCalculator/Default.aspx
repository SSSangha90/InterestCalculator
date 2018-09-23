<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InterestCalculator.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Investment Calculator</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Compound Interest Calculator</h1>
                <h3>This web app gives you an indication into the return you can make on your investment with compound interest.</h3>
        
        <asp:ValidationSummary runat="server"
        HeaderText="There were errors on the page:" />
        
        <p>Choose Fund</p>
        <asp:DropDownList ID="fundList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="fundList_SelectedIndexChanged">
            <asp:ListItem Value = "No Fund">No Fund</asp:ListItem> 
            <asp:ListItem Value = "Fund 1">Fund 1</asp:ListItem> 
            <asp:ListItem Value = "Fund 2">Fund 2</asp:ListItem> 
            <asp:ListItem Value = "Fund 3">Fund 3</asp:ListItem> 
            <asp:ListItem Value = "Fund 4">Fund 4</asp:ListItem> 
            <asp:ListItem Value = "Fund 5">Fund 5</asp:ListItem> 
        </asp:DropDownList>
        <asp:RequiredFieldValidator 
        controlToValidate="fundList"
        display="Dynamic"
        ID="rfvFundList" 
        runat="server" 
        ErrorMessage="Must pick a fund.">
        </asp:RequiredFieldValidator>
        <br />
        <p>Annual interest rate (average)</p>
        <asp:TextBox ID ="fundRate" runat="server"></asp:TextBox>
        <asp:CompareValidator 
        ID="cvfundRate" 
        runat="server" 
        ErrorMessage="Must enter a numeric value"
        controlToValidate="fundRate"
        display="Dynamic"
        operator="DataTypeCheck"
        type="Double">
        </asp:CompareValidator>
        <br />
        <p>Initial Investment</p>
        <asp:TextBox ID="principal" runat="server" OnTextChanged="principal_TextChanged"></asp:TextBox>
        <asp:CompareValidator 
        ID="cvPrincipal" 
        runat="server" 
        ErrorMessage="Must enter a numerical value"
        controlToValidate="principal"
        display="Dynamic"
        operator="DataTypeCheck"
        type="Double">
        </asp:CompareValidator>
        <br />
        <p>Monthly deposit</p>
        <asp:TextBox ID="monthlyDeposit" runat="server" OnTextChanged="monthlyDeposit_TextChanged"></asp:TextBox>
        <asp:CompareValidator 
        ID="cvMonthlyDeposit" 
        runat="server" 
        ErrorMessage="Must enter a numerical value"
        controlToValidate="monthlyDeposit"
        display="Dynamic"
        operator="DataTypeCheck"
        type="Double">
        </asp:CompareValidator>
        <br />
        <p>Duration (in years)</p>
        <asp:TextBox ID="duration" runat="server" OnTextChanged="duration_TextChanged"></asp:TextBox>
        <asp:CompareValidator 
        ID="cvDuration" 
        runat="server" 
        ErrorMessage="Must enter a numerical value"
        controlToValidate="duration"
        display="Dynamic"
        operator="DataTypeCheck"
        type="Double">
        </asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Calculate return" OnClick="Button1_Click" />
        <asp:Label ID="calculate" runat="server" CssClass=""></asp:Label>
        <br />
        <asp:Label ID="fundSelected" runat="server" CssClass="fundInfo"></asp:Label>

        <br />

       <%-- draft: charts--%>

        <asp:chart ID="Chart1" runat="server" Width="271px" OnLoad="Chart1_Load" Height="244px" >
        <Titles><asp:Title Text="1. European Index Trust:"></asp:Title></Titles>
            <Series>
                <asp:Series Name="SeriesFund1" ChartType="Doughnut" ChartArea="ChartFund1">
                    <Points>
                        <asp:DataPoint AxisLabel="France" YValues="22.8" />
                        <asp:DataPoint AxisLabel="Germany" YValues="20.6" />
                        <asp:DataPoint AxisLabel="Switzerland" YValues="17.9" />
                        <asp:DataPoint AxisLabel="Other" YValues="7.2" />
                        
                        <asp:DataPoint AxisLabel="Spa" YValues="6.5" />
                        <asp:DataPoint AxisLabel="Swe" YValues="5.8" />
                        <asp:DataPoint AxisLabel="Ita" YValues="5.2" />
                        <asp:DataPoint AxisLabel="Den" YValues="3.6" />
                        <asp:DataPoint AxisLabel="Holland" YValues="7.9" />
                        <asp:DataPoint AxisLabel="Finland" YValues="2.5" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartFund1">
                    <AxisX Title="Countries"></AxisX>
                    <AxisY Title="Percentage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:chart>
 
        <asp:chart ID="Chart2" runat="server" Width="271px" Height="244px" >
        <Titles><asp:Title Text="2. Global 100 Index Trust"></asp:Title></Titles>
            <Series>
                <asp:Series Name="SeriesFund2" ChartType="Doughnut" ChartArea="ChartFund2">
                    <Points>
                        <asp:DataPoint AxisLabel="US" YValues="65.6" />
                        <asp:DataPoint AxisLabel="UK" YValues="9.5" />
                        <asp:DataPoint AxisLabel="Fra" YValues="5.2" />
                        <asp:DataPoint AxisLabel="Sui" YValues="5.1" />
                        <asp:DataPoint AxisLabel="Ger" YValues="5.0" />
                        <asp:DataPoint AxisLabel="Jap" YValues="4.2" />
                        <asp:DataPoint AxisLabel="" YValues="1.7" />
                        <asp:DataPoint AxisLabel="" YValues="1.5" />
                        <asp:DataPoint AxisLabel="Other" YValues="1.5" />
                        <asp:DataPoint AxisLabel="" YValues="0.7" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartFund2">
                    <AxisX Title="Countries"></AxisX>
                    <AxisY Title="Percentage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:chart>

        <asp:chart ID="Chart3" runat="server" Width="271px" style="margin-right: 0px; margin-top: 0px" Height="244px">
        <Titles><asp:Title Text="3. Asian Income Trust"></asp:Title></Titles>
            <Series>
                <asp:Series Name="SeriesFund3" ChartType="Doughnut" ChartArea="ChartFund3" YValuesPerPoint="2">
                    <Points>
                        <asp:DataPoint AxisLabel="Australia" YValues="28.7" />
                        <asp:DataPoint AxisLabel="China" YValues="18.8" />
                        <asp:DataPoint AxisLabel="Singapore" YValues="11.4" />
                        <asp:DataPoint AxisLabel="Taiwan" YValues="10.3" />
                        <asp:DataPoint AxisLabel="HK" YValues="8.6" />
                        <asp:DataPoint AxisLabel="Ind" YValues="5.9" />
                        <asp:DataPoint AxisLabel="Kor" YValues="5.7" />
                        <asp:DataPoint AxisLabel="NZ" YValues="5.2" />
                        <asp:DataPoint AxisLabel="Thai" YValues="3.1" />
                        <asp:DataPoint AxisLabel="Other" YValues="2.3" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartFund3">
                    <AxisX Title="Countries"></AxisX>
                    <AxisY Title="Percentage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:chart>

        <asp:chart ID="Chart4" runat="server" Width="271px" style="margin-right: 0px; margin-top: 0px" Height="244px">
        <Titles><asp:Title Text="4. Ethical Trust"></asp:Title></Titles>
            <Series>
                <asp:Series Name="SeriesFund4" ChartType="Doughnut" ChartArea="ChartFund4" YValuesPerPoint="2">
                    <Points>
                        <asp:DataPoint AxisLabel="UK" YValues="100" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartFund4">
                    <AxisX Title="Countries"></AxisX>
                    <AxisY Title="Percentage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:chart>

        <asp:chart ID="Chart5" runat="server" Width="271px" style="margin-right: 0px; margin-top: 0px" Height="244px">
        <Titles><asp:Title Text="5. International Index Trust"></asp:Title></Titles>
            <Series>
                <asp:Series Name="SeriesFund5" ChartType="Doughnut" ChartArea="ChartFund5" YValuesPerPoint="2">
                    <Points>
                        <asp:DataPoint AxisLabel="US" YValues="61.0" />
                        <asp:DataPoint AxisLabel="Can" YValues="2.7" />         
                        <asp:DataPoint AxisLabel="Fra" YValues="3.7" />
                        <asp:DataPoint AxisLabel="Ger" YValues="4.1" />
                        <asp:DataPoint AxisLabel="Other" YValues="11.0" />
                        <asp:DataPoint AxisLabel="Jap" YValues="9.2" />
                        <asp:DataPoint AxisLabel="Sui" YValues="2.6" />
                        <asp:DataPoint AxisLabel="Aus" YValues="2.6" />
                        <asp:DataPoint AxisLabel="Kor" YValues="3.3" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartFund5">
                    <AxisX Title="Countries"></AxisX>
                    <AxisY Title="Percentage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:chart>

    </div>
    </form>
</body>
</html>

