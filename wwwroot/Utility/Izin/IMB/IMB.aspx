<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IMB.aspx.vb" Inherits="Utility_Izin_IMB" %>

<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3.Export, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
    function tambahanbangunan()
    {
    return BangunanTambahanGridView.GetFocusedRowIndex();
    }
    </script>

    <dx:XpoDataSource ID="IMBXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMB">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TujuanIMBXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBtujuan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PropinsiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Propinsi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource2" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan" Criteria="[KecamatanKabupatenID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KabupatenID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource2" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan" Criteria="[KelurahanKecamatanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PelaksanaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBpelaksana">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusTanahXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.tanah">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisBangunanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBbangunan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IMBLantaiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBlantai"
        Criteria="[IMBID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IMBID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="269px" Height="70px">
        <PanelCollection>
            <dx:PanelContent runat="server" Visible="True">
                <table style="width: 279px">
                    <tbody>
                        <tr>
                            <td style="height: 46px; width: 74px;">
                                No Permohonan</td>
                            <td style="height: 46px">
                                &nbsp;</td>
                            <td style="width: 78661232px; height: 46px">
                                <dx:ASPxTextBox runat="server" ID="CariNoPermohonanTextBox" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 78661232px; height: 46px">
                                &nbsp; &nbsp; &nbsp;<dx:ASPxButton runat="server" Text="Cari" ID="CariNoIjin">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <br />
    <hr />
    <br />
    <dxpc:ASPxPopupControl ID="NoIjinSementaraPopupControl" HeaderText="Ijin Sementara"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="NoIjinSementaraPopupControl" runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    <table>
                        <tr>
                            <td>
                                Nomor Ijin Sementara
                            </td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxTextBox ID="NoIjinSementaraTextBox" Width="170px" runat="server">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tanggal</td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="TglIjinSementaraDateEdit" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                    <dx:ASPxButton ID="NoIjinSementaraButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){NoIjinSementaraPopupControl.HideWindow();}" />
                    </dx:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="NoIjinIPBPopupControl" HeaderText="Ijin IPB" ClientInstanceName="NoIjinIPBPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    <table>
                        <tr>
                            <td>
                                Nomor Ijin IPB
                            </td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxTextBox ID="NoIjinIPBTextBox" Width="170px" runat="server">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tanggal Nomor Ijin IPB
                            </td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="TglIjinIPBDateEdit" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                    <dx:ASPxButton ID="NoijinIPBButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){NoIjinIPBPopupControl.HideWindow();}" />
                    </dx:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="IjinPopupControl" HeaderText="Nomor Ijin" ClientInstanceName="IjinPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    <table>
                        <tr>
                            <td>
                                Nomor Ijin
                            </td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxTextBox ID="NomorIjinTextBox" Width="170px" runat="server">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tanggal Nomor Ijin
                            </td>
                            <td>
                                :</td>
                            <td>
                                <dxe:ASPxDateEdit ID="NomorIjinDateEdit" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                    <dx:ASPxButton ID="NoIjinButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){IjinPopupControl.HideWindow();}" />
                    </dx:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <div style="float: left">
        <dx:ASPxButton ID="IjinButton" runat="server" Text="Nomor Izin" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e){IjinPopupControl.ShowWindow();}" />
        </dx:ASPxButton>
    </div>
    <div style="float: left">
        <dx:ASPxButton ID="IjinIPBButton" runat="server" Text="Ijin IPB" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e){NoIjinIPBPopupControl.ShowWindow();}" />
        </dx:ASPxButton>
    </div>
    <div style="float: none">
        <dx:ASPxButton ID="IjinSementara" runat="server" Text="Ijin Sementara" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e){NoIjinSementaraPopupControl.ShowWindow();}" />
        </dx:ASPxButton>
    </div>
    &nbsp;
    <dx:ASPxMenu ID="PemilikMenu" runat="server">
        <Items>
            <dx:MenuItem Text="Simpan">
            </dx:MenuItem>
        </Items>
    </dx:ASPxMenu>
    <hr />
    <br />
    <dx:ASPxPageControl ID="IMBPageControl" runat="server" ActiveTabIndex="0" Width="100%">
        <TabPages>
            <dx:TabPage Text="Pemilik">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <br />
                        <br />
                        <table style="width: 694px">
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    No KTP
                                </td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxTextBox ID="PemilikNoKTPTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px">
                                    Nama Pemilik</td>
                                <td style="width: 82px">
                                    <dx:ASPxTextBox ID="PemilikNamaTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Telepon</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxTextBox ID="PemilikTelponTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 102px; height: 16px">
                                    Fax</td>
                                <td style="width: 72px; height: 16px">
                                    <dx:ASPxTextBox ID="PemilikFaxTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Alamat Pemilik</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxTextBox ID="PemilikAlamatTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 4px">
                                    RT</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="PemilikRTTextBox" runat="server" MaxLength="2" Size="2">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 102px; height: 4px">
                                    RW</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="PemilikRWTextBox" runat="server" Width="40px" MaxLength="2">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 4px">
                                    KodePos</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="KodePosPemilikTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 102px; height: 16px">
                                    Kabupaten Pemilik</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxComboBox ID="PemilikKabupatenComboBox" runat="server" ValueField="KabupatenID"
                                        TextField="KabupatenNama" ValueType="System.String" DataSourceID="KabupatenXpoDataSource" AutoPostBack="true">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Kelurahan Pemilik</td>
                                <td style="width: 82px; height: 16px">
                                    &nbsp;<dx:ASPxComboBox ID="PemilikKelurahanComboBox" runat="server" ValueField="KelurahanID"
                                        TextField="KelurahanNama" ValueType="System.String" DataSourceID="KelurahanXpoDataSource2">
                                    </dx:ASPxComboBox>
                                </td>
                                <td style="width: 102px; height: 16px">
                                    Kecamatan Pemilik</td>
                                <td style="width: 82px; height: 16px">
                                    &nbsp;<dx:ASPxComboBox ID="PemilikKecamatanComboBox" runat="server" ValueField="KecamatanID"
                                        TextField="KecamatanNama" ValueType="System.String" DataSourceID="KecamatanXpoDataSource2" AutoPostBack="true">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Maksud / Tujuan</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxComboBox ID="PemilikMaksudComboBox" runat="server" ValueField="TujuanID"
                                        TextField="TujuanIMB" ValueType="System.String" DataSourceID="TujuanIMBXpoDataSource">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Pelaksana</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxComboBox ID="PemilikPelaksanaComboBox" runat="server" ValueField="PelaksanaID"
                                        TextField="Pelaksana" ValueType="System.String" DataSourceID="PelaksanaXpoDataSource">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                        &nbsp;
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Perusahaan">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <br />
                        <table style="width: 694px">
                            <tr>
                                <td style="width: 120px">
                                    Nama Perusahaan</td>
                                <td style="width: 82px">
                                    <dx:ASPxTextBox ID="PerusahaanNamaTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Telepon</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxTextBox ID="PerusahaanTelponTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 102px; height: 16px">
                                    Fax</td>
                                <td style="width: 72px; height: 16px">
                                    <dx:ASPxTextBox ID="PerusahaanFaxTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Alamat Perusahaan</td>
                                <td style="width: 82px; height: 16px">
                                    <dx:ASPxTextBox ID="PerusahaanAlamatTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 4px">
                                    RT</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="PerusahaanRTTextBox" runat="server" MaxLength="2" Size="2">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 102px; height: 4px">
                                    RW</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="PerusahaanRWTextBox" runat="server" Width="40px" MaxLength="2">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 4px">
                                    KodePos</td>
                                <td style="width: 82px; height: 4px">
                                    <dx:ASPxTextBox ID="PerusahaanKodePosTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 102px; height: 16px">
                                    Kabupaten</td>
                                <td style="width: 82px; height: 16px">
                                    <b>
                                        <dx:ASPxLabel ID="KudusLabel" runat="server" Text="Kudus">
                                        </dx:ASPxLabel>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Kecamatan</td>
                                <td style="width: 82px; height: 16px">
                                    &nbsp;
                                    <dx:ASPxComboBox ID="PerusahaanKecamatanComboBox" runat="server" ValueField="KecamatanID"
                                        TextField="KecamatanNama" ValueType="System.String" DataSourceID="KecamatanXpoDataSource">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px; height: 16px">
                                    Kelurahan</td>
                                <td style="width: 82px; height: 16px">
                                    &nbsp;<dx:ASPxComboBox ID="PerusahaanKelurahanComboBox" runat="server" ValueField="KelurahanID"
                                        TextField="KelurahanNama" ValueType="System.String" DataSourceID="KelurahanXpoDataSource">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Bangunan">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <br />
                        <table style="width: 441px; height: 190px">
                            <tr>
                                <td style="width: 187px; height: 12px">
                                    Lokasi Bangunan</td>
                                <td style="width: 151px; height: 12px">
                                    <dx:ASPxTextBox ID="bLokasiBangunanTextBox" runat="server" Height="15px" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 101px; height: 12px">
                                </td>
                                <td style="width: 101px; height: 12px">
                                </td>
                                <td style="width: 101px; height: 12px">
                                    RT / RW</td>
                                <td style="width: 99px; height: 12px">
                                    <dx:ASPxTextBox ID="bRTTextBox" runat="server" Width="170px" MaxLength="2">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 99px; height: 12px">
                                    <dx:ASPxTextBox ID="bRWTextBox" runat="server" Width="170px" MaxLength="2">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 187px">
                                    Kelurahan Lokasi</td>
                                <td style="width: 151px">
                                    <dx:ASPxComboBox ID="bKelurahanLokasiComboBox" DataSourceID="KelurahanXpoDataSource"
                                        ValueField="KelurahanID" TextField="KelurahanNama" runat="server" ValueType="System.String">
                                    </dx:ASPxComboBox>
                                </td>
                                <td style="width: 101px">
                                </td>
                                <td style="width: 101px">
                                </td>
                                <td style="width: 101px">
                                    Kodepos</td>
                                <td style="width: 99px">
                                    <dx:ASPxTextBox ID="bKodeposTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 187px; height: 37px">
                                    Kabupaten</td>
                                <td style="width: 151px; height: 37px">
                                    &nbsp;<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Kudus" Font-Bold="True"
                                        Height="19px" Width="37px">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 101px; height: 37px">
                                </td>
                                <td style="width: 101px; height: 37px">
                                </td>
                                <td style="width: 101px; height: 37px">
                                    No Sertifikat</td>
                                <td style="width: 99px; height: 37px">
                                    <dx:ASPxTextBox ID="bNoSertifikatTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 187px; height: 37px">
                                    Propinsi</td>
                                <td style="width: 151px; height: 37px">
                                    &nbsp;<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Jawa Tengah" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 101px; height: 37px">
                                </td>
                                <td style="width: 101px; height: 37px">
                                </td>
                                <td style="width: 101px; height: 37px">
                                    Pemilik Sertifikat</td>
                                <td style="width: 99px; height: 37px">
                                    <dx:ASPxTextBox ID="bPemilikSertifikatTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 187px; height: 16px">
                                    Luas Tanah</td>
                                <td style="width: 151px; height: 16px">
                                    &nbsp;<dx:ASPxTextBox ID="bLuasTanahTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 101px; height: 16px">
                                    M<sup>2</sup> ( dasar )</td>
                                <td style="width: 101px; height: 16px">
                                </td>
                                <td style="width: 101px; height: 16px">
                                    Status Tanah</td>
                                <td style="width: 99px; height: 16px">
                                    <dx:ASPxComboBox ID="bStatusTanahComboBox" DataSourceID="StatusTanahXpoDataSource"
                                        ValueField="StatusTanahID" TextField="StatusTanah" runat="server" ValueType="System.String">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 187px; height: 37px">
                                    Luas Bangunan</td>
                                <td style="width: 151px; height: 37px">
                                    &nbsp;<dx:ASPxTextBox ID="bLuasBangunanTextBox" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 101px; height: 37px">
                                    M<sup>2</sup> &nbsp;( Dasar )</td>
                                <td style="width: 101px; height: 37px">
                                </td>
                                <td style="width: 101px; height: 37px">
                                    Jenis Bangunan</td>
                                <td style="width: 99px; height: 37px">
                                    <dx:ASPxComboBox ID="bJenisBangunanComboBox" DataSourceID="JenisBangunanXpoDataSource"
                                        ValueField="JenisBangunanID" TextField="JenisBangunan" runat="server" ValueType="System.String">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Sarana Bangunan">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <table>
                            <tr>
                                <td style="width: 199px">
                                    Fungsi Bangunan</td>
                                <td style="width: 274px">
                                    <dx:ASPxTextBox ID="sbFungsiBangunanTextBox" runat="server" Height="21px" Width="268px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 199px; height: 16px">
                                    Garis Sempadan Pagar ( GSP )</td>
                                <td style="width: 274px; height: 16px">
                                    <dx:ASPxTextBox ID="sbGSPTextBox" runat="server" Height="21px" Width="266px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 199px">
                                    Garis Sempadan Bangunan ( GSB )</td>
                                <td style="width: 274px">
                                    <dx:ASPxTextBox ID="sbGSBTextBox" runat="server" Height="21px" Width="266px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 199px; height: 16px">
                                    Koefisien Dasar Bangunan ( KDP )</td>
                                <td style="width: 274px; height: 16px">
                                    <dx:ASPxTextBox ID="sbKDPTextBox" runat="server" Height="21px" Width="268px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <hr />
                        <table style="width: 703px">
                            <tr>
                                <td style="width: 153px; height: 16px">
                                    Jarak Dari Sumbu (as) Jalan</td>
                                <td style="width: 48px; height: 16px">
                                    <dx:ASPxTextBox ID="sbJarakDariSumbuJalanTextBox" runat="server" Height="21px" Width="50px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="height: 16px">
                                    meter</td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td style="width: 154px">
                                    Dari Jalan</td>
                                <td style="width: 322px">
                                    <dx:ASPxTextBox ID="sbDariJalanTextBox" runat="server" Width="320px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 43px">
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Bangunan Tambahan">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        &nbsp;<dx:ASPxMenu ID="ASPxMenu1" runat="server">
                            <Items>
                                <dx:MenuItem Name="New" Text="New">
                                </dx:MenuItem>
                                <dx:MenuItem Name="Edit" Text="Edit">
                                </dx:MenuItem>
                                <dx:MenuItem Name="Delete" Text="Delete">
                                </dx:MenuItem>
                            </Items>
                            <ClientSideEvents ItemClick="function(s, e)
                            {
                                if (e.item.name=='New')
                                {
                                    BangunanTambahanGridView.AddNewRow();
                                }
                                else
                                {
                                    if (e.item.name=='Edit')
                                    {
                                        BangunanTambahanGridView.StartEditRow(BangunanTambahanGridView.GetFocusedRowIndex());
                                    }
                                    else
                                    {
                                        if (e.item.name=='Delete')
                                        {
                                            BangunanTambahanGridView.DeleteRow(BangunanTambahanGridView.GetFocusedRowIndex());
                                        }
                                    }
                                }
                            }" />
                        </dx:ASPxMenu>
                        <br />
                        <%--<table>
                            <tr>
                                <td style="width: 42px; height: 16px">
                                    Lantai</td>
                                <td style="width: 22px; height: 16px">
                                </td>
                                <td style="width: 57px; height: 16px">
                                    <dx:ASPxTextBox ID="BTLantaiTextBox" runat="server" Height="21px" ReadOnly="True"
                                        Width="55px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 42px; height: 37px;">
                                    Luas</td>
                                <td style="width: 22px; height: 37px;">
                                </td>
                                <td style="width: 57px; height: 37px;">
                                    <dx:ASPxTextBox ID="BTLuasTextBox" runat="server" Height="21px" ReadOnly="True" Width="55px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 239px; height: 37px;">
                                    M<sup>2</sup></td>
                            </tr>
                        </table>
                        <br />
                        <dx:ASPxButton ID="SaveBTButton" runat="server" Text="Save" Visible="False">
                        </dx:ASPxButton>
                        <br />
                        <br />--%>
                        <dx:ASPxGridView ID="BangunanTambahanASPxGridView" runat="server" AutoGenerateColumns="False"
                            ClientInstanceName="BangunanTambahanGridView" DataSourceID="IMBLantaiXpoDataSource"
                            KeyFieldName="IMBlantaiID" Width="100%" OnRowInserting="BangunanTambahanASPxGridView_RowInserting">
                            <SettingsBehavior AllowFocusedRow="True" AllowSort="false" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="NoIjin" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Lantai" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Luas" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IMBlantaiID" ReadOnly="True" Visible="False"
                                    VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="true"
                                PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
