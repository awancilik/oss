<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="UserGroup.aspx.vb" Inherits="UserAccount_UserGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <csla:CslaDataSource ID="GroupListDatasource" runat="Server" />
    <csla:CslaDataSource ID="GroupDataSource" runat="Server" />
    <csla:CslaDataSource ID="GroupRoleListDataSource" runat="Server" />
    <csla:CslaDataSource ID="RoleListDataSource" runat="Server" />
    <csla:CslaDataSource ID="GroupMemberDataSource" runat="Server" />
    <csla:CslaDataSource ID="MemberListDataSource" runat="Server" />

    <script language="javascript" type="text/javascript">
    function Move()
    {
        return window.location='UserGroup.aspx?groupId=' + MasterGridView.keys[GridViewFocusedRow()]
    }
    function Move2()
    {
        return window.location='UserGroup.aspx?groupId=0'
    }
    function GridViewFocusedRow()
    {
        return MasterGridView.GetFocusedRowIndex();
    }
    function UserDetailFocusedRow()
    {
        return UserDetailGridView.GetFocusedRowIndex();
    }
    function AksesDetailFocusedRow()
    {
        return HakDetailGridView.GetFocusedRowIndex();
    }
    </script>

    <asp:MultiView ID="MainMultiview" runat="Server" ActiveViewIndex="0">
        <asp:View ID="ListView" runat="Server">
            <dxpc:ASPxPopupControl ID="confirmASPxPopupControl" runat="server" ClientInstanceName="confirmPopup"
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
                                                confirmPopup.HideWindow();
                                                MasterGridView.DeleteRow(GridViewFocusedRow());
                                                }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td>
                                                <dxe:ASPxButton runat="server" Text="Cancel" ID="cancelASPxButton" ClientInstanceName="cancelButton"
                                                    AutoPostBack="false" Width="100px">
                                                    <ClientSideEvents Click="function(s, e)
                                                {
                                                confirmPopup.HideWindow()
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
                    <Items>
                        <dxm:MenuItem Text="New" Name="New" />
                        <dxm:MenuItem Text="Edit" Name="Edit" />
                        <dxm:MenuItem Text="Delete" Name="Delete" />
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e)
                    {
                    if(e.item.name=='New')
                     {
                       Move2();
                     }
                     else
                      {
                     if (e.item.name=='Edit')
                        {
                        Move();
                        }
                     else
                        {
                            if (e.item.name=='Delete')
                            {
                                confirmPopup.ShowWindow();
                            }
                        }
                      }
                }" />
                </dxm:ASPxMenu>
            </div>
            <dxwgv:ASPxGridView ID="MasterGridView" runat="server" DataSourceID="GroupListDatasource"
                KeyFieldName="GroupId" AutoGenerateColumns="False" ClientInstanceName="MasterGridView"
                Width="500px">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Kelompok" FieldName="GroupId">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Keterangan" FieldName="Description">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <Settings ShowFilterRow="True" />
            </dxwgv:ASPxGridView>
        </asp:View>
        <asp:View ID="EditorView" runat="Server">
            <asp:DetailsView ID="EditorDetailsView" runat="Server" AutoGenerateRows="False" DataSourceID="GroupDataSource"
                DataKeyNames="GroupId" CssClass="dataprop">
                <RowStyle CssClass="rowfield" />
                <Fields>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <dxe:ASPxTextBox ID="GroupIdTextBox" runat="Server" Text='<%#Bind("GroupId") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="GroupIdLabel" runat="Server" Text='<%#Eval("GroupId") %>' />
                        </ItemTemplate>
                        <ItemStyle CssClass="field" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <dxe:ASPxTextBox ID="DescriptionTextBox" runat="Server" Text='<%#Bind("Description") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="DescriptionIdLabel" runat="Server" Text='<%#Eval("Description") %>' />
                        </ItemTemplate>
                        <ItemStyle CssClass="field" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <dxe:ASPxButton ID="ButtonInsert" runat="server" CommandName="Insert" Text="Save" />
                        </InsertItemTemplate>
                        <ItemStyle CssClass="field" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate></InsertItemTemplate>
                        <ItemTemplate>
                        <%--
                        ROLE SELECTION
                        --%>
                            <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="SelectionPopup"
                                Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                Width="400" Height="100" HeaderText="Pilih Hak Akses">
                                <ContentCollection>
                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                                        <dxe:ASPxButton ID="AddRoleButton" runat="Server" Text="Tambah" OnClick="AddRoleButton_Click">
                                            <ClientSideEvents Click="function(s, e){SelectionPopup.HideWindow()}" />
                                        </dxe:ASPxButton>
                                        <dxwgv:ASPxGridView ID="RoleGridview" runat="Server" DataSourceID="RoleListDataSource"
                                            ClientInstanceName="RoleGridview" KeyFieldName="RoleId" Width="350px">
                                            <Columns>
                                                <dxwgv:GridViewCommandColumn Caption="Pilih" VisibleIndex="0" ShowSelectCheckbox="True">
                                                </dxwgv:GridViewCommandColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Hak Akses" FieldName="RoleTitle" />
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                        </dxwgv:ASPxGridView>
                                    </dxpc:PopupControlContentControl>
                                </ContentCollection>
                            </dxpc:ASPxPopupControl>
                            <dxpc:ASPxPopupControl ID="ROLEConfirmPopup" runat="server" ClientInstanceName="ROLEConfirmPopup"
                                Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                Width="400" Height="100" HeaderText="Konfirmasi">
                                <ContentCollection>
                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl5" runat="server">
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
                                                                <dxe:ASPxButton runat="server" Text="OK" ID="ASPxButton3" ClientInstanceName="okButton"
                                                                    AutoPostBack="false" Width="100px">
                                                                    <ClientSideEvents Click="function(s, e){
                                                                ROLEConfirmPopup.HideWindow();
                                                                HakDetailGridView.DeleteRow(AksesDetailFocusedRow());
                                                                }" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxButton runat="server" Text="Cancel" ID="ASPxButton4" ClientInstanceName="cancelButton"
                                                                    AutoPostBack="false" Width="100px">
                                                                    <ClientSideEvents Click="function(s, e)
                                                                {
                                                                ROLEConfirmPopup.HideWindow()
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
                            <dxm:ASPxMenu ID="RoleSelectASPxMenu" runat="server" ClientInstanceName="ASPxMenu">
                                <ClientSideEvents ItemClick="function(s, e)
                            {
                               if (e.item.name=='new')
                                {
                                    SelectionPopup.ShowWindow();
                                }
                                else
                                {
                                    if (e.item.name=='Delete')
                                    {
                                        ROLEConfirmPopup.ShowWindow();
                                    }
                               }
                               
                            }" />
                                <Items>
                                    <dxm:MenuItem Text="Add" Name="new" />
                                    <dxm:MenuItem Text="Delete" Name="Delete" />
                                </Items>
                            </dxm:ASPxMenu>
                            <dxwgv:ASPxGridView ID="DetailGridView" runat="server" DataSourceID="GroupRoleListDataSource"
                                KeyFieldName="RoleId" AutoGenerateColumns="False" ClientInstanceName="HakDetailGridView"
                                Width="600px">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Hak Akses" FieldName="RoleTitle" VisibleIndex="1" />
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dxwgv:ASPxGridView>
                        </ItemTemplate>
                        <ItemStyle CssClass="field" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate></InsertItemTemplate>
                        <ItemTemplate>
                            <%--
                            MEMBER SELECTION
                            --%>
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl2" runat="server" ClientInstanceName="MemberSelectionPopup"
                                    Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                    Width="400" Height="100" HeaderText="Pilih Anggota">
                                    <ContentCollection>
                                        <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                                            <dxe:ASPxButton ID="AddMemberButton" runat="Server" Text="Tambah" OnClick="AddMemberButton_Click">
                                                <ClientSideEvents Click="function(s, e){MemberSelectionPopup.HideWindow()}" />
                                            </dxe:ASPxButton>
                                            <dxwgv:ASPxGridView ID="MemberGridview" runat="Server" DataSourceID="MemberListDataSource"
                                                ClientInstanceName="MemberGridview" KeyFieldName="UserId" Width="350px">
                                                <Columns>
                                                    <dxwgv:GridViewCommandColumn Caption="Pilih" VisibleIndex="0" ShowSelectCheckbox="True">
                                                    </dxwgv:GridViewCommandColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Nama" FieldName="UserName" />
                                                </Columns> 
                                                <SettingsBehavior AllowFocusedRow="True" />
                                            </dxwgv:ASPxGridView>
                                        </dxpc:PopupControlContentControl>
                                    </ContentCollection>
                                </dxpc:ASPxPopupControl>
                                <dxpc:ASPxPopupControl ID="ASPxPopupControl3" runat="server" ClientInstanceName="MemberConfirmPopup"
                                    Modal="true" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                    Width="400" Height="100" HeaderText="Konfirmasi">
                                    <ContentCollection>
                                        <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
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
                                                                    MemberConfirmPopup.HideWindow();
                                                                    UserDetailGridView.DeleteRow(UserDetailFocusedRow());
                                                                    }" />
                                                                    </dxe:ASPxButton>
                                                                </td>
                                                                <td>
                                                                    <dxe:ASPxButton runat="server" Text="Cancel" ID="ASPxButton2" ClientInstanceName="cancelButton"
                                                                        AutoPostBack="false" Width="100px">
                                                                        <ClientSideEvents Click="function(s, e)
                                                                    {
                                                                    MemberConfirmPopup.HideWindow()
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
                                <dxm:ASPxMenu ID="MemASPxMenu" runat="server" ClientInstanceName="MemASPxMenu">
                                    <ClientSideEvents ItemClick="function(s, e)
                                {
                                   if (e.item.name=='new')
                                    {
                                        MemberSelectionPopup.ShowWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Delete')
                                        {
                                            MemberConfirmPopup.ShowWindow();
                                        }
                                   }
                                   
                                }" />
                                    <Items>
                                        <dxm:MenuItem Text="Add" Name="new" />
                                        <dxm:MenuItem Text="Delete" Name="Delete" />
                                    </Items>
                                </dxm:ASPxMenu>
                                <dxwgv:ASPxGridView ID="MemberSelectionGridView" runat="server" DataSourceID="GroupMemberDataSource"
                                    KeyFieldName="UserId" AutoGenerateColumns="False" ClientInstanceName="UserDetailGridView"
                                    Width="600px">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Anggota" FieldName="UserName" VisibleIndex="1" />
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="true" />
                                </dxwgv:ASPxGridView>
                        </ItemTemplate>
                        <ItemStyle CssClass="field" />
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
