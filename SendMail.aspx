<%@ Page Title="" Language="C#" MasterPageFile="~/LBRCE.master" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="SendMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<link href="Styles/TextBox.css" rel="stylesheet" type="text/css" />
    <link href="Styles/dropDown.css" rel="stylesheet" type="text/css" />
    <link href="Styles/button.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<br /><br /><br />
    <asp:Panel ID="pnl" runat="server">
    <table width="100%">
    <tr>
        <td style="width:15%"></td>
        <td style="width:70%" align="center">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="12px" ForeColor="MidnightBlue"></asp:Label>
        </td>
        <td style="width:15%"></td>
    </tr>
    <tr>
        <td style="width:15%"></td>
        <td style="width:70%">
            <asp:Panel ID="pnl1" runat="server">
            
            <table width="100%" style="font-weight:bold;">
            <tr style="height:45px; background-color:#DAE6FF;">
                    <td style="width:30%; color:#548AB2; font-size:12px;" align="right">
                        To &nbsp;
                    </td>
                    <td style="width:70%; color:#27292B; font-size:12px;">
                         &nbsp; 
                        <asp:TextBox ID="txtToAddress" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                        <asp:Label ID="lblName" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr style="height:45px; background-color:#EFF3FE;">
                    <td style="width:30%; color:#548AB2; font-size:12px;" align="right">
                        Subject &nbsp;
                    </td>
                    <td style="width:70%; color:#27292B; font-size:12px;">
                         &nbsp; 
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="textbox"></asp:TextBox>
                        <asp:Label ID="lblEmail" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblGemail" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr style="height:45px; background-color:#DAE6FF;">
                    <td style="width:30%; color:#548AB2; font-size:12px;" align="right">
                        <asp:Label ID="lblRecipient" runat="server" Text="Recipient"></asp:Label> &nbsp;
                    </td>
                    <td style="width:70%; color:#27292B; font-size:12px;">
                        &nbsp; 
                        <asp:DropDownList ID="ddlRecipient" runat="server" CssClass="dropdown" 
                            AutoPostBack="True" onselectedindexchanged="ddlRecipient_SelectedIndexChanged">
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Guardian</asp:ListItem>
                            <asp:ListItem>Student &amp; Guardian</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height:45px; background-color:#EFF3FE;">
                    <td style="width:30%; color:#548AB2; font-size:12px;" align="right">
                        Message &nbsp;
                    </td>
                    <td style="width:70%; color:#27292B; font-size:12px;">
                        &nbsp; 
                        <asp:TextBox ID="txtMessage" runat="server" Height="100px" TextMode="MultiLine" 
                            Width="300px"></asp:TextBox>
                    </td>
                </tr>
               
            </table>
            </asp:Panel>
            <br />

        </td>
        <td style="width:15%"></td>
    </tr>
</table>
    </asp:Panel>
    <table width="100%">
        <tr>
            <td style="width:100%;" align="center">
                <asp:Button ID="btnSend" runat="server" Text="Send" 
                    CssClass="button" onclick="btnSend_Click" />
                
            </td>
        </tr>
    </table>
</asp:Content>

