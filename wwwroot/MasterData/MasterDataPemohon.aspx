<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataPemohon.aspx.vb" Inherits="MasterData_MasterDataPemohon"
    Title="OSS" %>

<%@ Register Assembly="DevExpress.Xpo.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
function PemohonFocus()
{
    return PemohonGridView.GetFocusedRowIndex();
}
 
    </script>

    <dx:XpoDataSource ID="PemohonXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Pemohon">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PropinsiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Propinsi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan">
    </dx:XpoDataSource>
    <dx:ASPxPopupControl ID="PemohonPopupControl" runat="server" ClientInstanceName="PemohonPopupControl"
        HeaderText="Peringatan ! !" Width="340px" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                Apakah Anda Yakin Ingin Menghapus Data Pemohon Ini?<br />
                <center>
                    <dx:ASPxMenu runat="server" ID="ASPxMenu1">
                        <Items>
                            <dx:MenuItem Text="Ya" Name="Ya">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Tidak" Name="Tidak">
                            </dx:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e)
                        {
                          if(e.item.name=='Ya')
                             {
                                PemohonGridView.DeleteRow(PemohonFocus());
                                PemohonPopupControl.HideWindow();
                                PemohonGridView.PerformCallBack();
                             }          
                             else
                             { 
                               if(e.item.name=='Tidak')
                                 {  
                                   PemohonPopupControl.HideWindow();                  
                                 }
                               
                             }       
                        }" />
                    </dx:ASPxMenu>
                </center>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <br />
    <table>
    <tr>
    <td style="padding-left:228px;">
    <dx:ASPxMenu ID="PemohonMenu" runat="server" ClientInstanceName="PemohonMenu">
        <Items>
            <dx:MenuItem Text="New" Name="New">
            </dx:MenuItem>
            <dx:MenuItem Text="Edit" Name="Edit">
            </dx:MenuItem>
            <dx:MenuItem Text="Delete" Name="Delete">
            </dx:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function (s,e)
        {
         if(e.item.name=='New')
            {
                PemohonGridView.AddNewRow();
            }
            else
            {
                if(e.item.name=='Edit')
                {
                    PemohonGridView.StartEditRow(PemohonFocus());
                }
             else
             {
                if(e.item.name=='Delete')
                    {
                       PemohonPopupControl.ShowWindow();
                    }
               }
            }
        }
        " />
    </dx:ASPxMenu>
    <dx:ASPxGridView ID="PemohonGridView1" runat="server" ClientInstanceName="PemohonGridView"
        AutoGenerateColumns="False" DataSourceID="PemohonXpoDataSource" KeyFieldName="PemohonID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="PemohonID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="PemohonNama" VisibleIndex="0">
                <PropertiesTextEdit MaxLength="254">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings ColumnSpan="2" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Alamat" FieldName="PemohonAlamat" Visible="False"
                VisibleIndex="1">
                <PropertiesMemoEdit Height="50px" Rows="5">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesMemoEdit>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataComboBoxColumn Caption="Propinsi" FieldName="PemohonPropinsiID!Key"
                Name="PropinsiComboBox" Visible="False" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="PropinsiXpoDataSource" EnableIncrementalFiltering="True"
                    TextField="PropinsiNama" ValueField="PropinsiID" ValueType="System.String">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Kabupaten" FieldName="PemohonKabupatenID!Key"
                Visible="False" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="KabupatenXpoDataSource" EnableIncrementalFiltering="True"
                    TextField="KabupatenNama" ValueField="KabupatenID" ValueType="System.String">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Kecamatan" FieldName="PemohonKecamatanID!Key"
                Visible="False" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="KecamatanXpoDataSource" EnableIncrementalFiltering="True"
                    TextField="KecamatanNama" ValueField="KecamatanID" ValueType="System.String">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Kelurahan" FieldName="PemohonKelurahanID!Key"
                Visible="False" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="KelurahanXpoDataSource" EnableIncrementalFiltering="True"
                    TextField="KelurahanNama" ValueField="KelurahanID" ValueType="System.String">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="RT" FieldName="PemohonRT" Visible="False" VisibleIndex="1">
                <PropertiesTextEdit MaxLength="15">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                        <RegularExpression ValidationExpression="\d+" ErrorText="Harus Diisi Angka!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="RW" FieldName="PemohonRW" Visible="False" VisibleIndex="1">
                <PropertiesTextEdit MaxLength="20">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                        <RegularExpression ValidationExpression="\d+" ErrorText="Harus Diisi Angka!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Telpon" FieldName="PemohonTelpon" Name="Telpon"
                VisibleIndex="2">
                <PropertiesTextEdit MaxLength="50">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Fax" FieldName="PemohonFax" Visible="False" VisibleIndex="3">
                <PropertiesTextEdit MaxLength="50">
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kode Pos" FieldName="PemohonKodePos" Visible="False"
                VisibleIndex="3">
                <PropertiesTextEdit MaxLength="20">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" ErrorText="Harus Diisi!!" />
                        <RegularExpression ValidationExpression="\d+" ErrorText="Harus Diisi Angka!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AlamatFull" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" />
    </dx:ASPxGridView>
    </td>
    </tr>
    </table>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
--%>
