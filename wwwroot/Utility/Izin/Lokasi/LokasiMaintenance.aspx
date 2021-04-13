<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiMaintenance.aspx.vb" Inherits="Utility_Izin_LokasiMaintenance"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="LokasiTujuanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiTujuan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HDPPTXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiHDPPT">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiIP">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IUXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiIU">
    </dx:XpoDataSource>
    Lokasi Maintenance
    <br />
    <dxm:ASPxMenu ID="ASPxMenu4" runat="server">
        <Items>
            <%--<dxm:MenuItem Name="Tujuan" Text="Tujuan">
            </dxm:MenuItem>--%>
            <dxm:MenuItem Name="HDPPT" Text="HDPPT">
            </dxm:MenuItem>
            <dxm:MenuItem Name="IP Tanah" Text="IP Tanah">
            </dxm:MenuItem>
            <dxm:MenuItem Name="Indek Usaha" Text="Indek Usaha">
            </dxm:MenuItem>
        </Items>
    </dxm:ASPxMenu>
    <script language="javascript" type="text/javascript">
    function tujuan(){
    return TujuanGridView.GetFocusedRowIndex();
    }
    function hdppt(){
    return HDPPTGridView.GetFocusedRowIndex();
    }
    function ip(){
    return IPGridView.GetFocusedRowIndex();
    }
    function iu(){
    return IUGridView.GetFocusedRowIndex();
    }
    </script>

    <dxp:ASPxPanel ID="TujuanPanel" runat="server" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="TujuanMenu" runat="server" Width="200px">
                    <Items>
                        <dxm:MenuItem Name="New" Text="New">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Edit" Text="Edit">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Delete" Text="Delete">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                TujuanGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    TujuanGridView.StartEditRow(tujuan());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        TujuanGridView.DeleteRow(tujuan());
                    }
                }
            }
}" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="TujuanGridView" ClientInstanceName="TujuanGridView" DataSourceID="LokasiTujuanXpoDataSource"
                    KeyFieldName="TujuanID" AutoGenerateColumns="False" runat="server" Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="TujuanID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Tujuan" VisibleIndex="0" Width="170px">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="true" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <dxp:ASPxPanel ID="HDPPTPanel" runat="server" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="ASPxMenu1" runat="server" Width="200px">
                    <Items>
                        <dxm:MenuItem Name="New" Text="New">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Edit" Text="Edit">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Delete" Text="Delete">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                HDPPTGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    HDPPTGridView.StartEditRow(hdppt());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        HDPPTGridView.DeleteRow(hdppt());
                    }
                }
            }
}" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="HDPPTGridView" ClientInstanceName="HDPPTGridView" DataSourceID="HDPPTXpoDataSource"
                    KeyFieldName="LokasiHDPPTID" AutoGenerateColumns="False" runat="server" Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="LokasiHDPPTID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Peruntukan" VisibleIndex="0" Width="170px">
                            <PropertiesTextEdit Width="170px">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Jenis" VisibleIndex="1" Width="170px">
                            <PropertiesTextEdit Width="170px">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Harga" VisibleIndex="2" Width="170px">
                            <PropertiesTextEdit Width="170px">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <dxp:ASPxPanel ID="IPPanel" runat="server" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="ASPxMenu2" runat="server" Width="200px">
                    <Items>
                        <dxm:MenuItem Name="New" Text="New">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Edit" Text="Edit">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Delete" Text="Delete">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                IPGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    IPGridView.StartEditRow(ip());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        IPGridView.DeleteRow(ip());
                    }
                }
            }
}" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="IPGridView" ClientInstanceName="IPGridView" DataSourceID="IPXpoDataSource"
                    KeyFieldName="LokasiIP_" AutoGenerateColumns="False" runat="server" Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="LokasiIP_" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="IPTanah" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Indeks" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <dxp:ASPxPanel ID="IUPanel" runat="server" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="ASPxMenu3" runat="server" Width="200px">
                    <Items>
                        <dxm:MenuItem Name="New" Text="New">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Edit" Text="Edit">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Delete" Text="Delete">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                IUGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    IUGridView.StartEditRow(iu());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        IUGridView.DeleteRow(iu());
                    }
                }
            }
}" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="IUGridView" ClientInstanceName="IUGridView" DataSourceID="IUXpoDataSource"
                    KeyFieldName="LokasiIU_" AutoGenerateColumns="False" runat="server" Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="LokasiIU_" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Jenis" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Indek" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
</asp:Content>
