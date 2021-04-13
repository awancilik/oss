<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserLogin.aspx.vb" Inherits="UserAccount_UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Halaman Login</title>
</head>
<body style="background-image:url(App_Themes/Red Wine/Demo/Gradient.jpg);">
    <form id="form1" runat="server">
    <div>
        <center>
            <div id="login_area" >
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" HeaderText="Login">
                    <PanelCollection>
                        <dxp:PanelContent runat="server">
                            <div id="login_box" >
                                <table border="0" cellspacing="0" style="border-collapse:collapse; width: 400px; background-color:#C1DBFA;">
                                    <tr align="center">
                                        <td colspan="3">
                                            <dxe:ASPxLabel ID="welcomeLabel" runat="server" Text="Selamat Datang" Font-Size="X-Large" Font-Bold="True" />
                                            <div style="margin-top:5px;">
                                                <dxe:ASPxLabel ID="instructionLabel" runat="server" Text="Mohon sebutkan username dan kata kunci anda"
                                                 Font-Size="Larger" Font-Bold="true" />
                                            </div>
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr align="center" style="padding-top:5px;">
                                        <th style="padding-left:15px;">
                                            <dxe:ASPxLabel ID="UserNameLabel" runat="server" Text="User Name" Font-Bold="True" />
                                        </th>
                                        <th>
                                            <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text=":" Font-Bold="True" />
                                        </th>
                                        <td style="padding-left:5px;">
                                            <dxe:ASPxTextBox ID="UserName" runat="server" Width="200px" />
                                        </td>
                                    </tr>
                                    <tr align="center" style="padding-top:5px;">
                                        <th style="padding-left:15px;">
                                            <dxe:ASPxLabel ID="PasswordLabel" runat="server" Text="Password" Font-Bold="True" />
                                        </th>
                                        <th>
                                            <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text=":" Font-Bold="True" />
                                        </th>
                                        <td style="padding-left:5px;">
                                            <dxe:ASPxTextBox ID="Password" runat="server" Password="True" Width="200px" />
                                        </td>
                                    </tr>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3" align="center" style="padding-top:5px; padding-bottom:5px">
                                                <dxe:ASPxButton ID="LoginButton" runat="server" Text="Log In" Width="83px" />
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </dxp:PanelContent>
                    </PanelCollection>
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                </dxrp:ASPxRoundPanel>
            
                <center style="padding-top:20px;">
                    <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Login" Visible="false" Width="380px" >
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <div >
                                    <asp:Panel runat="server" ID="MessageBoxPanel" >
                                        <table class="MessageBox" id="MessageBox" width="315" border="0" cellpadding="0"
                                            cellspacing="0" >
                                            <tr align="Center">
                                                <td class="MsgBox" id="MsgBox_icon" rowspan="3"></td>
                                            </tr>
                                            <tr align="center">
                                                <td class="MsgBox" id="MsgBox_prompt" style="height: 22px">
                                                <asp:Label ID="MsgBoxPromptLabel" runat="server" Text="[prompt]" Font-Bold="True" /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    </dxrp:ASPxRoundPanel>    
                </center>
                <div id="login_feedback">
                    <p>
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False" Text="&nbsp;"></asp:Literal>
                    </p>
                </div>
            </div>
        </center>
    </div>
    </form>
</body>
</html>
