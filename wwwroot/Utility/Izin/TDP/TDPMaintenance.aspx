<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDPMaintenance.aspx.vb" Inherits="Utility_Izin_TDPMaintenance" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
function Maksud(){
return MaksudGridView.GetFocusedRowIndex();
}
    </script>

    <dx:XpoDataSource ID="MaksudXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDPMaksud">
    </dx:XpoDataSource>
   <%-- <dx:XpoDataSource ID="BentukXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDPtBentuk">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusTempatXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDPStatus">
    </dx:XpoDataSource>--%>
    <dxpc:ASPxPopupControl ID="BentukPopupControl" ClientInstanceName="BentukPopupControl"
        Modal="true" runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Anda Yakin akan Menghapus Data Ini ?<br />
                    <br />
                    <dxm:ASPxMenu ID="ASPxMenu3" runat="server">
                        <Items>
                            <dxm:MenuItem Name="OK" Text="OK">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Batal" Text="Batal">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){if(e.item.name='OK'){
                        BentukGridView.DeleteRow();BentukPopupControl.HideWindow();}else (e.item.name='Batal'){BentukPopupControl.HideWindow();}}" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="MaksudPopupControl" Modal="true" runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Anda Yakin akan Menghapus Data Ini ?<br />
                    <br />
                    <dxm:ASPxMenu ID="hapusMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Name="OK" Text="OK">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Batal" Text="Batal">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){if(e.item.name='OK'){MaksudGridView.DeleteRow();MaksudPopupControl.HideWindow();}else (e.item.name='Batal'){MaksudPopupControl.HideWindow();}}" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxm:ASPxMenu ID="ASPxMenu1" runat="server">
        <Items>
            <dxm:MenuItem Text="New" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Edit" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Delete" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e){
	if (e.item.name=='New')
            {
                MaksudGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    MaksudGridView.StartEditRow(Maksud());
                }
                else
                {
                   if (e.item.name=='Delete')
                    {
                       MaksudPopupControl.ShowWindow();
                    }
                 }
            }
}" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="MaksudGridView" ClientInstanceName="MaksudGridView" DataSourceID="MaksudXpoDataSource"
        runat="server" AutoGenerateColumns="False" KeyFieldName="TDPMaksudID">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="TDPMaksudID" ReadOnly="True" Visible="false"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Maksud" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
    </dxwgv:ASPxGridView>
    <br />
    <%--<dxm:ASPxMenu ID="ASPxMenu2" runat="server">
        <Items>
            <dxm:MenuItem Text="New" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Edit" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Delete" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e){
	if (e.item.name=='New')
            {
                BentukGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    BentukGridView.StartEditRow(Bentuk());
                }
                else
                {
                   if (e.item.name=='Delete')
                    {
                       BentukPopupControl.ShowWindow();
                    }
                 }
            }
}" />
    </dxm:ASPxMenu>--%>
    <%-- <dxwgv:ASPxGridView ID="BentukGridView" ClientInstanceName="BentukGridView" DataSourceID="BentukXpoDataSource"
        runat="server" AutoGenerateColumns="False" KeyFieldName="BentukPerusahaanID">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="BentukPerusahaanID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="BentukPerusahaan" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
    <br />
       <dxm:ASPxMenu ID="ASPxMenu4" runat="server">
        <Items>
            <dxm:MenuItem Text="New" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Edit" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Delete" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e){
	if (e.item.name=='New')
            {
                StatusTempatGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    StatusTempatGridView.StartEditRow(StatusTempat());
                }
                else
                {
                   if (e.item.name=='Delete')
                    {
                       StatusTempatPopupControl.ShowWindow();
                    }
                 }
            }
}" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="StatusTempatGridView" ClientInstanceName="StatusTempatGridView" DataSourceID="StatusTempatXpoDataSource"
        runat="server" AutoGenerateColumns="False" KeyFieldName="TDPStatusID">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="TDPStatusID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="StatusTempatUsaha" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>--%>
</asp:Content>
