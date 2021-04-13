<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Utility_Login" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="float:right">
    <dxe:ASPxButton ID="UserButton" runat="server" Text="Buat Baru"></dxe:ASPxButton>
    </div>
    <asp:Login ID="Login1" runat="server" Width="269px">
    
    </asp:Login>
    
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Visible="True">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    

</asp:Content>

