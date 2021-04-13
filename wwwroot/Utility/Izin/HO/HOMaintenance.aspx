<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HOMaintenance.aspx.vb" Inherits="Utility_Izin_HOMaintenance" Title="HO Maintenance" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
    function FocusGangguan()
    {
        return GridGangguan.GetFocusedRowIndex();
    }
    function GangguanBaru()
    {
        GridGangguan.AddNewRow();
    }
    function FocusKapasitas()
    {
        return GridKapasitas.GetFocusedRowIndex();
    }
    function FocusJenisUsaha()
    {
        return GridViewJenisUsaha.GetFocusedRowIndex();
    }
    function FocusEnergi()
    {
        return GridEnergi.GetFocusedRowIndex();
    }
    </script>

    <dx:XpoDataSource ID="XpoDataSourceGangguan" runat="server" TypeName="Bisnisobjek.OSS.HOGangguan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceUsaha" runat="server" TypeName="Bisnisobjek.OSS.HO">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceGanggu" runat="server" TypeName="Bisnisobjek.OSS.HOJenisGangguan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceJenis" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisUsaha">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceEnergi" runat="server" TypeName="Bisnisobjek.OSS.HOEnergi">
    </dx:XpoDataSource>
    <dx:ASPxPopupControl ID="PopupGangguan" HeaderText="Konfirmasi" runat="server" ClientInstanceName="PopupGangguan"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="windowCenter" Modal="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <center>
                    Apakah anda yakin akan menghapus Gangguan ini ?<br />
                    <br />
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
                GridGangguan.DeleteRow(FocusGangguan());
				PopupGangguan.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                   PopupGangguan.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ASPxPopupControlJenisUsaha" HeaderText="Konfirmasi" runat="server"
        ClientInstanceName="PopupJenisUsaha" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="windowCenter"
        Modal="true">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControlJenisUsaha" runat="server">
                Apakah anda yakin akan menghapus Gangguan ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu2" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	        if (e.item.name=='Ya')
            {
                GridViewJenisUsaha.DeleteRow(FocusJenisUsaha());
				PopupJenisUsaha.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                   PopupJenisUsaha.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ASPxPopupControlEnergi" HeaderText="Konfirmasi" runat="server"
        ClientInstanceName="PopupEnergi" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="windowCenter"
        Modal="true">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControlEnergi" runat="server">
                Apakah anda yakin akan menghapus Sumber Energi ini ?<br />
                <br />
                <center>
                    <dx:ASPxMenu ID="ASPxMenu3" runat="server">
                        <Items>
                            <dx:MenuItem Name="Ya" Text="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Name="Tidak" Text="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	        if (e.item.name=='Ya')
            {
                GridEnergi.DeleteRow(FocusEnergi());
				PopupEnergi.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                   PopupEnergi.HideWindow();
                }
               
            }
}" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <strong>HO Maintenance</strong>
    <dx:ASPxMenu ID="PilihHOMaintenance" runat="server">
        <Items>
            <%--<dx:MenuItem Text="Gangguan" Name="Gangguan">
            </dx:MenuItem>--%>
            <dx:MenuItem Text="Jenis Usaha" Name="JenisUsaha">
            </dx:MenuItem>
           <%-- <dx:MenuItem Text="Energi" Name="Energi">
            </dx:MenuItem>--%>
        </Items>
    </dx:ASPxMenu>
    <table>
        <tr style="width: 100px;">
            <td style="padding-left: 10px; padding-bottom: 79px; float: left;">
                <dx:ASPxPanel ID="PanelGangguan" runat="Server" ClientInstanceName="PanelGangguan">
                    <PanelCollection>
                        <dxp:PanelContent runat="server">
                            <dx:ASPxMenu ID="MenuUsaha" ClientInstanceName="MenuUsaha" runat="server">
                                <items>
                        <dx:MenuItem Text="Buat Baru" Name="Baru">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Ubah" Name="Ubah">
                        </dx:MenuItem>
                        <dx:MenuItem Text="Hapus" Name="Hapus">
                        </dx:MenuItem>
                    </items>
                                <clientsideevents itemclick="function(s,e){
        if(e.item.name=='Baru')
           {
             GridGangguan.AddNewRow();
           }
           else 
               {
                    if(e.item.name=='Ubah')
                    {
                        GridGangguan.StartEditRow(FocusGangguan());
                    }
                    else 
                        {
                          if(e.item.name=='Hapus')
                            {
                              PopupGangguan.ShowWindow();
                            }
                          }
                        }
                    }" />
                            </dx:ASPxMenu>
                            <dx:ASPxGridView ID="ASPGridView" runat="Server" Width="200px" DataSourceID="XpoDataSourceGanggu"
                                AutoGenerateColumns="False" ClientInstanceName="GridGangguan" KeyFieldName="GangguanID">
                                <settingsbehavior allowfocusedrow="True" />
                                <columns>
                        <dx:GridViewDataTextColumn FieldName="GangguanID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Gangguan" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                    </columns>
                            </dx:ASPxGridView>
                        </dxp:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
                <br />
            </td>
            <td style="padding-bottom: 79px; float: left;">
                <dx:ASPxPanel ID="PanelJenisUsaha" runat="Server" ClientInstanceName="PanelJenisUsaha">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxMenu ID="MenuJenis" runat="server" ClientInstanceName="MenuJenis">
                                <items>
<dx:MenuItem Text="Buat Baru" Name="Baru"></dx:MenuItem>
<dx:MenuItem Text="Ubah" Name="Ubah"></dx:MenuItem>
<dx:MenuItem Text="Hapus" Name="Hapus"></dx:MenuItem>
</items>
                                <clientsideevents itemclick="function(s,e){
    if(e.item.name=='Baru')
    {
        GridViewJenisUsaha.AddNewRow();
    }
      else
            {
              if(e.item.name=='Ubah')
              {
                GridViewJenisUsaha.StartEditRow(FocusJenisUsaha());
              }
              else
                    {
                     if(e.item.name=='Hapus')
                        {
                           PopupJenisUsaha.ShowWindow();
                        }
                    }
                   }
               }" />
                            </dx:ASPxMenu>
                            <table>
                                <tr>
                                    <td style="padding-bottom: 100px;">
                                        <dx:ASPxGridView ID="GridViewJenisUsaha" ClientInstanceName="GridViewJenisUsaha"
                                            runat="server" DataSourceID="XpoDataSourceJenis" AutoGenerateColumns="False"
                                            KeyFieldName="JenisUsahaID" Width="200px">
                                            <settingsbehavior allowfocusedrow="True" />
                                            <columns>
<dx:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="JenisUsahaID"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn VisibleIndex="0" FieldName="JenisUsaha" Caption="Jenis Usaha"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="Koefisien"></dx:GridViewDataTextColumn>
</columns>
                                        </dx:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </td>
            <td style="padding-bottom: 95px; float: left;">
                <dx:ASPxPanel ID="PanelEnergi" runat="Server" ClientInstanceName="PanelEnergi">
                    <PanelCollection>
                        <dxp:PanelContent>
                            <dx:ASPxMenu ID="MenuSumber" runat="server" ClientInstanceName="MenuSumberEnergi">
                                <items>
                <dx:MenuItem Name="Baru" Text="Buat Baru">
                </dx:MenuItem>
                <dx:MenuItem Name="Ubah" Text="Ubah">
                </dx:MenuItem>
                <dx:MenuItem Name="Hapus" Text="Hapus">
                </dx:MenuItem>
            </items>
                                <clientsideevents itemclick="function(s,e){
    if(e.item.name=='Baru')
        {
            GridEnergi.AddNewRow();
        }
        else
            {
               if(e.item.name=='Ubah')
                  {
                    GridEnergi.StartEditRow(FocusEnergi());
                  }
                else 
                   {
                    if(e.item.name=='Hapus')
                      {
                         PopupEnergi.ShowWindow();
                      }
                  }
                 }
             }" />
                            </dx:ASPxMenu>
                            <dx:ASPxGridView ID="GridSumber" runat="server" ClientInstanceName="GridEnergi" AutoGenerateColumns="False"
                                DataSourceID="XpoDataSourceEnergi" KeyFieldName="EnergiID" Width="200px">
                                <columns>
                <dx:GridViewDataTextColumn FieldName="EnergiID" ReadOnly="True" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Energi" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
            </columns>
                                <settingsbehavior allowfocusedrow="true" />
                            </dx:ASPxGridView>
                        </dxp:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </td>
        </tr>
    </table>
</asp:Content>
