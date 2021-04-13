<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IMBMaintenance.aspx.vb" Inherits="Utility_Izin_IMBMaintenance" Title="IMB Maintenance" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dxnb" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
 
    <script language="javascript" type="text/javascript">
        function JenisBangunan(){
           return JenisBangunanGridView.GetFocusedRowIndex();
        }
        function Tujuan(){
           return TujuanGridView.GetFocusedRowIndex();
        }
        function Pelaksana(){
            return PelaksanaGridView.GetFocusedRowIndex();
        }
        function Status(){
            return StatusGridView.GetFocusedRowIndex();
        }
        function JenisBahan(){
            return JenisBahanGridView.GetFocusedRowIndex();
        }
        function Koef(){
        return KoefGridView.GetFocusedRowIndex();
        }
    </script>

    <dx:XpoDataSource ID="JenisBangunanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBbangunan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TujuanPengajuanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBtujuan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PelaksanaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBpelaksana">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusTanahXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.tanah">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisBahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBbahan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KoefXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef">
    </dx:XpoDataSource>
    &nbsp; &nbsp;
    <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="JenisBangunanPopupControl"
        runat="server" HeaderText="Peringatan" Width="369px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus Jenis Bangunan ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	                        if (e.item.name=='Ya')
                                    {
                                        JenisBangunanGridView.DeleteRow(JenisBangunan());
				                        JenisBangunanPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            JenisBangunanPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
   <dx:ASPxPopupControl ID="ASPxPopupControl2" ClientInstanceName="TujuanPengajuanPopupControl"
        runat="server" HeaderText="Peringatan" Width="301px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus Tujuan ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu6" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	                        if (e.item.name=='Ya')
                                    {
                                        TujuanGridView.DeleteRow(Tujuan());
				                        TujuanPengajuanPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            TujuanPengajuanPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxPopupControl ID="ASPxPopupControl3" ClientInstanceName="PelaksanaPopupControl"
        runat="server" HeaderText="Peringatan" Width="334px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus Pelaksana ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu7" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
		                        if (e.item.name=='Ya')
                                    {
                                        PelaksanaGridView.DeleteRow(Pelaksana());
				                        PelaksanaPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            PelaksanaPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxPopupControl ID="ASPxPopupControl4" ClientInstanceName="StatusTanahPopupControl"
        runat="server" HeaderText="Peringatan" Width="333px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapus Status Tanah ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu8" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	                        if (e.item.name=='Ya')
                                    {
                                        StatusGridView.DeleteRow(Status());
				                        StatusTanahPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            StatusTanahPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxPopupControl ID="ASPxPopupControl5" ClientInstanceName="JenisBahanPopupControl"
        runat="server" HeaderText="Peringatan" Width="333px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah anda yakin akan menghapusJenis Bahan ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu9" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	                        if (e.item.name=='Ya')
                                    {
                                        JenisBahanGridView.DeleteRow(JenisBahan());
				                        JenisBahanPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            JenisBahanPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxPopupControl ID="KoefPopupControl" ClientInstanceName="KoefPopupControl"
        runat="server" HeaderText="Peringatan" Width="100%">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                Apakah anda yakin akan menghapus Jenis Koefisien ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu10" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	                        if (e.item.name=='Ya')
                                    {
                                        KoefGridView.DeleteRow(Koef());
				                        KoefPopupControl.HideWindow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Tidak')
                                        {
                                            KoefPopupControl.HideWindow();
                                        }
                                       
                                    }
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <table>
        <tr>
        <h1>IMB Maintenance</h1>
            <td style="padding-left:10px; width: 795px;">
            <dxnb:ASPxNavBar ID="JenisBangunan" runat="server" Width="480px" ExpandButtonPosition="Default" EnableAnimation="true" ExpandGroupAction="Click">
               <Groups>
               <dxnb:NavBarGroup Text="Jenis Bangunan" Expanded="False">
               <ContentTemplate>
                <dx:ASPxRoundPanel ID="JenisBangunanRoundPanel" runat="server" HeaderText="Jenis Bangunan"
                    Width="475px">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="JenisBangunanMenu" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ClientSideEvents ItemClick="function(s, e) {
	                                if (e.item.name=='New')
                                            {
                                                JenisBangunanGridView.AddNewRow();
                                            }
                                            else
                                            {
                                                if (e.item.name=='Edit')
                                                {
                                                    JenisBangunanGridView.StartEditRow(JenisBangunan());
                                                }
                                                else
                                                {
                                                   if (e.item.name=='Delete')
                                                    {
                                                       JenisBangunanPopupControl.ShowWindow();
                                                    }
                                                 }
                                            }
                                }" />
                            </dx:ASPxMenu>
 
                            <dx:ASPxGridView ID="JenisBangunanGridView" ClientInstanceName="JenisBangunanGridView"
                                runat="server" DataSourceID="JenisBangunanXpoDataSource" AutoGenerateColumns="False"
                                KeyFieldName="JenisBangunanID" Width="440px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="JenisBangunanID" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="JenisBangunan" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                </ContentTemplate>
               </dxnb:NavBarGroup>
               </Groups>               
               
                </dxnb:ASPxNavBar>
 
                <dxnb:ASPxNavBar ID="TujuanPengajuan" runat="Server" Width="480px" EnableAnimation="true">
                <Groups>
                <dxnb:NavBarGroup Text="Tujuan Pengajuan" Expanded="False">
                <ContentTemplate>
               <dx:ASPxRoundPanel ID="TujuanRoundPanel" runat="server" HeaderText="Tujuan Pengajuan"
                    Width="479px">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="ASPxMenu2" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
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
                                                    TujuanGridView.StartEditRow(Tujuan());
                                                }
                                                else
                                                {
                                                   if (e.item.name=='Delete')
                                                    {
                                                       TujuanPengajuanPopupControl.ShowWindow();
                                                    }
                                                 }
                                            }
                                }" />
                            </dx:ASPxMenu>

                            <dx:ASPxGridView ID="TujuanGridView" ClientInstanceName="TujuanGridView" runat="server"
                                DataSourceID="TujuanPengajuanXpoDataSource" AutoGenerateColumns="False" KeyFieldName="TujuanID"
                                Width="440px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="TujuanID" ReadOnly="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TujuanIMB" Caption="Tujuan IMB" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                 </ContentTemplate>
                </dxnb:NavBarGroup>
                </Groups>
                </dxnb:ASPxNavBar>
  
                <dxnb:ASPxNavBar runat="server" ID="Pelaksana" EnableAnimation="true" Width="480px">
                 <Groups>
                 <dxnb:NavBarGroup Text="Pelaksana" Expanded="False">
                 <ContentTemplate>
                 <dx:ASPxRoundPanel ID="PelaksanaanRoundPanel" runat="server" Width="474px" HeaderText="Pelaksana">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="ASPxMenu3" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ClientSideEvents ItemClick="function(s, e) {
		                                if (e.item.name=='New')
                                            {
                                                PelaksanaGridView.AddNewRow();
                                            }
                                            else
                                            {
                                                if (e.item.name=='Edit')
                                                {
                                                    PelaksanaGridView.StartEditRow(Pelaksana());
                                                }
                                                else
                                                {
                                                   if (e.item.name=='Delete')
                                                    {
                                                       PelaksanaPopupControl.ShowWindow();
                                                    }
                                                 }
                                            }
                                }" />
                            </dx:ASPxMenu>
                 
                            <dx:ASPxGridView ID="PelaksanaGridView" ClientInstanceName="PelaksanaGridView" runat="server"
                                DataSourceID="PelaksanaXpoDataSource" AutoGenerateColumns="False" KeyFieldName="PelaksanaID"
                                Width="440px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="PelaksanaID" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Pelaksana" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                </ContentTemplate>
                 </dxnb:NavBarGroup>
                 </Groups>
                 
                </dxnb:ASPxNavBar>

                <dxnb:ASPxNavBar ID="Status" runat="server" EnableAnimation="true" Width="480px">
                <Groups>
                <dxnb:NavBarGroup Text="Status" Expanded="False">
                <ContentTemplate>
               <dx:ASPxRoundPanel ID="StatusRoundPanel" runat="server" Width="468px" HeaderText="Status">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="ASPxMenu4" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ClientSideEvents ItemClick="function(s, e) {
			                                if (e.item.name=='New')
                                            {
                                                StatusGridView.AddNewRow();
                                            }
                                            else
                                            {
                                                if (e.item.name=='Edit')
                                                {
                                                    StatusGridView.StartEditRow(Status());
                                                }
                                                else
                                                {
                                                   if (e.item.name=='Delete')
                                                    {
                                                       StatusTanahPopupControl.ShowWindow();
                                                    }
                                                 }
                                            }
                                }" />
                            </dx:ASPxMenu>
                          
                            <dx:ASPxGridView ID="StatusGridView" ClientInstanceName="StatusGridView" runat="server"
                                DataSourceID="StatusTanahXpoDataSource" AutoGenerateColumns="False" KeyFieldName="StatusTanahID"
                                Width="440px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="StatusTanah" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="StatusTanahID" ReadOnly="True" Visible="False"
                                        VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                </ContentTemplate>
                </dxnb:NavBarGroup>
                </Groups>
                </dxnb:ASPxNavBar>
             
                <dxnb:ASPxNavBar runat="Server" ID="JenisBahan" Width="480px" EnableAnimation="true">
                <Groups>
                <dxnb:NavBarGroup Text="Jenis Bahan" Expanded="False">
                <ContentTemplate>
                <dx:ASPxRoundPanel ID="JenisBahanRoundPanel" runat="server" Width="468px" HeaderText="Jenis Bahan">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="ASPxMenu5" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ClientSideEvents ItemClick="function(s, e) {
		                                if (e.item.name=='New')
                                    {
                                        JenisBahanGridView.AddNewRow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Edit')
                                        {
                                            JenisBahanGridView.StartEditRow(JenisBahan());
                                        }
                                        else
                                        {
                                           if (e.item.name=='Delete')
                                            {
                                               JenisBahanPopupControl.ShowWindow();
                                            }
                                         }
                                    }
                                }" />
                            </dx:ASPxMenu>
                            <br />
                            <dx:ASPxGridView ID="JenisBahanGridView" ClientInstanceName="JenisBahanGridView"
                                runat="server" DataSourceID="JenisBahanXpoDataSource" AutoGenerateColumns="False"
                                KeyFieldName="BahanID" Width="440px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="BahanID" ReadOnly="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Bahan" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Satuan" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                </ContentTemplate>
                </dxnb:NavBarGroup>
                </Groups>
                </dxnb:ASPxNavBar>
  
                <dxnb:ASPxNavBar ID="Koefisien" runat="Server" EnableAnimation="true" Width="480px">
                <Groups>
                <dxnb:NavBarGroup Text="Koefisien" Expanded="false">
                <ContentTemplate>
                <dx:ASPxRoundPanel ID="KoefRoundPanel" runat="server" Width="100%" HeaderText="Koefisien">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="KoefMenu" runat="server">
                                <Items>
                                    <dx:MenuItem Text="Buat Baru" Name="New">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Ubah" Name="Edit">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Hapus" Name="Delete">
                                    </dx:MenuItem>
                                </Items>
                                <ClientSideEvents ItemClick="function(s, e) {
		                                if (e.item.name=='New')
                                    {
                                        KoefGridView.AddNewRow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Edit')
                                        {
                                            KoefGridView.StartEditRow(Koef());
                                        }
                                        else
                                        {
                                           if (e.item.name=='Delete')
                                            {
                                               KoefPopupControl.ShowWindow();
                                            }
                                         }
                                    }
                                }" />
                            </dx:ASPxMenu>
                            <br />
                            <dx:ASPxGridView ID="KoefGridView" ClientInstanceName="KoefGridView"
                                runat="server" DataSourceID="KoefXpoDataSource" AutoGenerateColumns="False"
                                KeyFieldName="KoefisienID" Width="440px">
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="KoefisienID" ReadOnly="True" Visible="False" Width="100px" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Kategori" VisibleIndex="1">
                                        <PropertiesComboBox ValueType="System.String">
                                            <Items>
                                                <dx:ListEditItem Text="Harga Dasar Bangunan Lain" Value="Harga Dasar Bangunan Lain" />
                                                <dx:ListEditItem Text="Harga Dasar Bangunan Umum" Value="Harga Dasar Bangunan Umum" />
                                                <dx:ListEditItem Text="Kota / Daerah" Value="Daerah" />
                                                <dx:ListEditItem Text="Kelas Jalan" Value="Kelas Jalan" />
                                                <dx:ListEditItem Text="Kelas Bangunan" Value="Kelas Bangunan" />
                                                <dx:ListEditItem Text="Status Bangunan" Value="Status Bangunan" />
                                                <dx:ListEditItem Text="Guna Bangunan" Value="Guna Bangunan" />
                                                <dx:ListEditItem Text="Tingkat Bangunan" Value="Tingkat Bangunan" />
                                                <dx:ListEditItem Text="Luas Bangunan" Value="Luas Bangunan" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="JenisKategori" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Koefisien" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                               <SettingsBehavior AllowFocusedRow="True" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
                </ContentTemplate>
                </dxnb:NavBarGroup>
                </Groups>
                </dxnb:ASPxNavBar>   
            </td>
        </tr>
    </table>
    
</asp:Content>

