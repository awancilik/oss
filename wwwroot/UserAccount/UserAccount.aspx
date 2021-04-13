<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="UserAccount.aspx.vb" Inherits="UserAccount_UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<csla:CslaDataSource ID="UserListDatasource" runat="Server" />
<csla:CslaDataSource ID="UserDataSource" runat="Server" />
<csla:CslaDataSource ID="UserGroupListDataSource" runat="Server" />
<csla:CslaDataSource ID="GroupListDataSource" runat="Server" />

<!-- 
JAVA SCRIPT
-->
<script language="javascript" type="text/javascript">
    function GridViewFocusedRow()
    {
        return MasterGridView.GetFocusedRowIndex();
    }
</script>

<asp:MultiView ID="MainMultiview" runat="Server" ActiveViewIndex="0">
    <asp:View ID="ListView" runat="Server">
    
        <dxpc:ASPxPopupControl ID="MasterDeleteConfirmPopup" runat="server" ClientInstanceName="MasterDeleteConfirmPopup"
            Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="400" Height="100" HeaderText="Konfirmasi">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center" valign="middle">
                                Apakah anda yakin akan menghapus ?
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="middle">
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton runat="server" Text="OK" ID="ASPxButton1" ClientInstanceName="okButton" 
                                            AutoPostBack="false" Width="100px">
                                                <ClientSideEvents Click="function(s, e){
                                                MasterDeleteConfirmPopup.HideWindow();
                                                MasterGridView.DeleteRow(GridViewFocusedRow());
                                                }" />
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton runat="server" Text="Cancel" ID="ASPxButton2" ClientInstanceName="cancelButton" 
                                            AutoPostBack="false" Width="100px">
                                                <ClientSideEvents Click="function(s, e)
                                                {
                                                MasterDeleteConfirmPopup.HideWindow()
                                                }" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        
        <div style="padding-bottom: 5px;">
            <dxm:ASPxMenu ID="MasterASPxMenu" runat="server" ClientInstanceName="MasterASPxMenu">
                <ClientSideEvents ItemClick="function(s, e)
                {
                    if (e.item.name=='New')
                    {
                        MasterGridView.AddNewRow();
                    }
                    else
                    {
                        if (e.item.name=='Edit')
                        {
                            MasterGridView.StartEditRow(GridViewFocusedRow());
                        }
                        else
                        {
                            if (e.item.name=='Delete')
                            {
                                MasterDeleteConfirmPopup.ShowWindow();
                            }
                        }
                    }
                }" />
                <Items>
                    <dxm:MenuItem Text="New" Name="New" />
                    <dxm:MenuItem Text="Edit" Name="Edit" />
                    <dxm:MenuItem Text="Delete" Name="Delete" />
                </Items>
            </dxm:ASPxMenu>
        </div>

        <dxwgv:ASPxGridView ID="MasterGridView" runat="server" DataSourceID="UserListDatasource"
        KeyFieldName="UserId" AutoGenerateColumns="False" ClientInstanceName="MasterGridView" Width="500px">
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="Kode Pengguna" FieldName="UserId" ReadOnly="true">
                    <EditItemTemplate>
                        <dxe:ASPxTextBox ID="ItemIdTextBox" runat="server" Width="200px" MaxLength="20" 
                        Text='<%# Bind ("UserId") %>' ValidationSettings-ValidationGroup='<%# Container.ValidationGroup %>'>
                            <ValidationSettings>
                                <RequiredField IsRequired="True" ErrorText="Kode harus diisi" />
                            </ValidationSettings>
                        </dxe:ASPxTextBox>
                    </EditItemTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Nama" FieldName="UserName">
                    <EditItemTemplate>
                        <dxe:ASPxTextBox ID="UserNameTextBox" runat="server" Width="200px" MaxLength="20" 
                        Text='<%# Bind ("UserName") %>' ValidationSettings-ValidationGroup='<%# Container.ValidationGroup %>'>
                            <ValidationSettings>
                                <RequiredField IsRequired="True" ErrorText="Kode harus diisi" />
                            </ValidationSettings>
                        </dxe:ASPxTextBox>
                    </EditItemTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Keterangan" FieldName="UserDesc">
                    <EditItemTemplate>
                        <dxe:ASPxTextBox ID="DescTextBox" runat="server" Width="200px" MaxLength="20" Text='<%# Bind ("UserDesc") %>' >
                        </dxe:ASPxTextBox>
                    </EditItemTemplate>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <Settings ShowFilterRow="True" />
        </dxwgv:ASPxGridView>
        
    </asp:View>
    <%--<asp:View ID="EditorView" runat="Server">
    
        <asp:DetailsView ID="EditorDetailsView" runat="Server" AutoGenerateRows="False"
        DataSourceID="GroupDataSource" DataKeyNames="GroupId"> 
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                        <dxe:ASPxLabel ID="UserIdLabel" runat="Server" Text='<%#Eval("UserId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <dxe:ASPxLabel ID="UserNameLabel" runat="Server" Text='<%#Eval("UserName") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <dxe:ASPxLabel ID="UserDescLabel" runat="Server" Text='<%#Eval("UserDesc") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <hr />
        
        GROUP LIST
                
        <dxpc:ASPxPopupControl ID="GroupSelectionPopup" runat="server" ClientInstanceName="GroupSelectionPopup"
            Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="400" Height="100" HeaderText="Pilih Anggota" >
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                    <dxe:ASPxButton ID="AddGroupButton" runat="Server" Text="Tambah" OnClick="AddGroupButton_Click">
                        <ClientSideEvents Click="function(s, e){GroupSelectionPopup.HideWindow()}" />
                    </dxe:ASPxButton>
                    <dxwgv:ASPxGridView ID="GroupGridview" runat="Server" DataSourceID="GroupListDataSource"
                    ClientInstanceName="GroupGridview" KeyFieldName="GroupId">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="Pilih" VisibleIndex="0" ShowSelectCheckbox="True"  >
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nama" FieldName="Description" />
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                    </dxwgv:ASPxGridView>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>

        <dxpc:ASPxPopupControl ID="GroupDeleteConfirmPopup" runat="server" ClientInstanceName="GroupDeleteConfirmPopup"
            Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="400" Height="100" HeaderText="Konfirmasi">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center" valign="middle">
                                Apakah anda yakin akan menghapus ?
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="middle">
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton runat="server" Text="OK" ID="okASPxButton" ClientInstanceName="okButton" 
                                            AutoPostBack="false" Width="100px">
                                                <ClientSideEvents Click="function(s, e){
                                                GroupDeleteConfirmPopup.HideWindow();
                                                MasterGridView.DeleteRow(GridViewFocusedRow());
                                                }" />
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton runat="server" Text="Cancel" ID="cancelASPxButton" ClientInstanceName="cancelButton" 
                                            AutoPostBack="false" Width="100px">
                                                <ClientSideEvents Click="function(s, e)
                                                {
                                                GroupDeleteConfirmPopup.HideWindow()
                                                }" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>

        <dxm:ASPxMenu ID="GroupSelectASPxMenu" runat="server" ClientInstanceName="ASPxMenu">
            <ClientSideEvents ItemClick="function(s, e)
            {
               if (e.item.name=='new')
                {
                    GroupSelectionPopup.ShowWindow();
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        GroupDeleteConfirmPopup.ShowWindow();
                    }
               }
               
            }" />
            <Items>
                <dxm:MenuItem Text="Add" Name="new" />
                <dxm:MenuItem Text="Delete" Name="Delete" />
            </Items>
        </dxm:ASPxMenu>
        
        <dxwgv:ASPxGridView ID="DetailGridView" runat="server" DataSourceID="UserGroupListDataSource"
        KeyFieldName="GroupId" AutoGenerateColumns="False" ClientInstanceName="DetailGridView">
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="Kelompok" FieldName="Description" VisibleIndex="1" />
            </Columns>
        </dxwgv:ASPxGridView>
        
    </asp:View>--%>
</asp:MultiView>


        
</asp:Content>
