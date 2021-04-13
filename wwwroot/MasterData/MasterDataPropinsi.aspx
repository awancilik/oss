<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataPropinsi.aspx.vb" Inherits="MasterData_MasterDataPropinsi"
    Title="Data Propinsi" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
        
        function FocusPropinsiRow()
            {
                return PropinsiGridView.GetFocusedRowIndex();
            }
        function FocusKabupatenRow()
            {
                return KabupatenGridView.GetFocusedRowIndex();
            }
        function FocusKecamatanRow()
            {
                return KecamatanGridView.GetFocusedRowIndex();
            }
        function FocusKelurahanRow()
            {
                return KelurahanGridView.GetFocusedRowIndex();
            }
        function OnGridFocusedRowIndex()
            {
                PropinsiGridView.GetRowValues(Propinsi.GetFocusedRowIndex(), 'PropinsiID');
            }
    </script>

    <dx:XpoDataSource ID="PropinsiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Propinsi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten"
        Criteria="[KabupatenPropinsiID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PropinsiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan"
        Criteria="[KecamatanKabupatenID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KabupatenID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:ASPxPopupControl ID="PeringatanPopupControl" ClientInstanceName="PeringatanPopupControl"
        runat="server" HeaderText="Peringatan!!" PopupHorizontalAlign="windowCenter"
        PopupVerticalAlign="windowCenter" Width="344px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Maaf Tidak Bisa Menghapus Data Propinsi Karena Masih Terdapat Data Kabupaten<br />
                <center>
                    <dx:ASPxMenu ID="PeringatanASPxMenu" runat="server" HorizontalAlign="Center">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	PeringatanPopupControl.HideWindow();
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="PropinsiPopupControl" ClientInstanceName="PropinsiPopupControl"
        runat="server" Width="352px" HeaderText="Peringatan ! !" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah Anda Yakin Akan Menghapus Data Propinsi Ini ?<br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu2" runat="server" HorizontalAlign="Center">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ItemStyle BackColor="lightskyblue" />
                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='Ya')
            {
                PropinsiGridView.DeleteRow(FocusPropinsiRow());
                PropinsiPopupControl.HideWindow();
                OnGridFocusedRowChanged();
				
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                    PropinsiPopupControl.HideWindow();
                }
               
           }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="KabupatenPopupControl" ClientInstanceName="KabupatenPopupControl"
        runat="server" Width="352px" HeaderText="Peringatan ! !" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah Anda Yakin Akan Menghapus Data Kabupaten Ini ?<br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu3" runat="server" HorizontalAlign="Center">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ItemStyle BackColor="lightskyblue" />
                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='Ya')
            {
                KabupatenGridView.DeleteRow(FocusKabupatenRow());
				KabupatenPopupControl.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                    KabupatenPopupControl.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="KecamatanPopupControl" ClientInstanceName="KecamatanPopupControl"
        runat="server" Width="353px" HeaderText="Peringatan ! !" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus data Kecamatan ini ?<br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu4" runat="server" HorizontalAlign="Center">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ItemStyle BackColor="lightskyblue" />
                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='Ya')
            {
                KecamatanGridView.DeleteRow(FocusKecamatanRow());
				KecamatanPopupControl.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                    KecamatanPopupControl.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="KelurahanPopupControl" ClientInstanceName="KelurahanPopupControl"
        runat="server" Width="358px" HeaderText="Peringatan ! !" PopupHorizontalAlign="windowCenter"
        PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus data Kelurahan ini ?<br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu5" runat="server" HorizontalAlign="Center">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='Ya')
            {
                KelurahanGridView.DeleteRow(FocusKelurahanRow());
				KelurahanPopupControl.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                    KelurahanPopupControl.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <strong>Propinsi</strong>
    <table>
        <tr>
            <td>
                <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                    <Items>
                        <dx:MenuItem Name="New" Text="New">
                        </dx:MenuItem>
                        <dx:MenuItem Name="Edit" Text="Edit">
                        </dx:MenuItem>
                        <dx:MenuItem Name="Delete" Text="Delete">
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle BackColor="lightskyblue" />
                    <ClientSideEvents ItemClick="function(s, e) 
        {
        if (e.item.name=='New')
            {
                PropinsiGridView.AddNewRow();
            }
          else
            {
                if (e.item.name=='Edit')
                {
                    PropinsiGridView.StartEditRow(FocusPropinsiRow());
                }
                  else 
                    {
                        PropinsiPopupControl.ShowWindow();
                    }
             }
            }" />
                </dx:ASPxMenu>
                <dx:ASPxGridView ID="PropinsiGridView" runat="server" AutoGenerateColumns="False"
                    ClientInstanceName="PropinsiGridView" DataSourceID="PropinsiXpoDataSource" KeyFieldName="PropinsiID">
                    <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" />
                    <Templates>
                        <DetailRow>
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                                <Items>
                                    <dx:MenuItem Name="New" Text="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="Edit" Text="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Name="Delete" Text="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ItemStyle BackColor="lightskyblue" />
                                <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                KabupatenGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    KabupatenGridView.StartEditRow(FocusKabupatenRow());
                }
                else
                {
                   if (e.item.name=='Delete')
                    {
                       KabupatenPopupControl.ShowWindow();
                    }
                 }
            }
}" />
                            </dx:ASPxMenu>
                            <dx:ASPxGridView ID="KabupatenGridView" runat="server" AutoGenerateColumns="False"
                                ClientInstanceName="KabupatenGridView" DataSourceID="KabupatenXpoDataSource"
                                KeyFieldName="KabupatenID" OnDetailRowExpandedChanged="kabupatenGridView_DetailRowExpandedChanged"
                                OnRowInserting="kabupatenGridView_RowInserting">
                                <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" />
                                <Templates>
                                    <DetailRow>
                                        <br />
                                        <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                                            <Items>
                                                <dx:MenuItem Name="New" Text="New">
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="Edit" Text="Edit">
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="Delete" Text="Delete">
                                                </dx:MenuItem>
                                            </Items>
                                            <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                KecamatanGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    KecamatanGridView.StartEditRow(FocusKecamatanRow());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        KecamatanPopupControl.ShowWindow();
                    }
                }
            }
}" />
                                        </dx:ASPxMenu>
                                        <br />
                                        <dx:ASPxGridView ID="KecamatanGridView" runat="server" AutoGenerateColumns="False"
                                            ClientInstanceName="KecamatanGridView" DataSourceID="KecamatanXpoDataSource"
                                            KeyFieldName="KecamatanID" OnDetailRowExpandedChanged="KecamatanGridView_DetailRowExpandedChanged"
                                            OnRowInserting="KecamatanGridView_RowInserting">
                                            <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <br />
                                                    <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                                                        <Items>
                                                            <dx:MenuItem Name="New" Text="New">
                                                            </dx:MenuItem>
                                                            <dx:MenuItem Name="Edit" Text="Edit">
                                                            </dx:MenuItem>
                                                            <dx:MenuItem Name="Delete" Text="Delete">
                                                            </dx:MenuItem>
                                                        </Items>
                                                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                KelurahanGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    KelurahanGridView.StartEditRow(FocusKelurahanRow());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        KelurahanPopupControl.ShowWindow();
                    }
                }
            }
}" />
                                                    </dx:ASPxMenu>
                                                    <br />
                                                    <br />
                                                    <dx:ASPxGridView ID="KelurahanGridView" runat="server" AutoGenerateColumns="False"
                                                        ClientInstanceName="KelurahanGridView" DataSourceID="KelurahanXpoDataSource"
                                                        KeyFieldName="KelurahanID" OnRowInserting="KelurahanGridView_RowInserting">
                                                        <SettingsBehavior AllowDragDrop="false" AllowFocusedRow="true" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="KelurahanID" ReadOnly="True" Visible="False"
                                                                VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="KelurahanKecamatanID!Key" Visible="False" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Nama Kelurahan" FieldName="KelurahanNama" VisibleIndex="0">
                                                                <PropertiesTextEdit Width="170px">
                                                                    <ValidationSettings SetFocusOnError="true">
                                                                        <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Kepala Kelurahan" FieldName="KelurahanKepala"
                                                                VisibleIndex="1">
                                                                <PropertiesTextEdit Width="170px">
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="false" />
                                                    </dx:ASPxGridView>
                                                </DetailRow>
                                            </Templates>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="KecamatanID" ReadOnly="True" Visible="False"
                                                    VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KecamatanKabupatenID!Key" Width="170px" Visible="False"
                                                    VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="KecamatanNama" VisibleIndex="0">
                                                    <PropertiesTextEdit Width="170px">
                                                        <ValidationSettings SetFocusOnError="true">
                                                            <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Camat" FieldName="KecamatanKepala" Width="170px"
                                                    VisibleIndex="1">
                                                    <PropertiesTextEdit Width="170px">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                                        </dx:ASPxGridView>
                                        <br />
                                    </DetailRow>
                                </Templates>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="KabupatenID" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="KabupatenPropinsiID!Key" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Kabupaten" FieldName="KabupatenNama" Width="170px"
                                        VisibleIndex="0">
                                        <PropertiesTextEdit>
                                            <ValidationSettings SetFocusOnError="true">
                                                <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ibukota" FieldName="KabupatenKota" Width="170px"
                                        VisibleIndex="1">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Walikota / Bupati" FieldName="KabupatenBupati"
                                        Width="170px" VisibleIndex="2">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                            </dx:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="PropinsiID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Propinsi" FieldName="PropinsiNama" Width="170px"
                            VisibleIndex="0">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ibukota" FieldName="PropinsiIbukota" Width="170px"
                            VisibleIndex="1">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Gubernur" FieldName="PropinsiGubernur" Width="170px"
                            VisibleIndex="2">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                </dx:ASPxGridView>
            </td>
        </tr>
    </table>
</asp:Content>
