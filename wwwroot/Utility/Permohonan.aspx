<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Permohonan.aspx.vb" Inherits="Utility_Permohonan" Title="Permohonan" %>
<%@ Reference VirtualPath="~/report/reportPage/IMB/Permohonan.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="JenisUsahaHOXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisUsaha">
    </dx:XpoDataSource>
    <dxcb:ASPxCallback ID="ASPxCallback1" runat="server">
        <ClientSideEvents BeginCallback="function(s, e){syaratIzinGridView.DataBind();}" />
    </dxcb:ASPxCallback>
    <dx:XpoDataSource ID="jenisIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SIUPJenisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin"
        Criteria="JenisIzinNama LIKE 'SIUP %'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="imbXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinIMB" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="lokasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinLokasi" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="iuiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinUI" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="iptXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinPT" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="ipiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinPI" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="tdiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinTDI" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="hoXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinHO" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="siupXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinSIUP" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="tdpXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinTDP" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="tdpJenisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin"
        Criteria="JenisIzinNama LIKE 'TDP %'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="syaratIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SyaratIzin"
        Criteria="[JenisPermohonanIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisPermohonanIzinID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="masterDataSyaratXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataSyarat">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="kabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="kecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan"
        Criteria="[KecamatanKabupatenID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KabupatenID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="kelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxcb:ASPxCallback ID="ASPxCallback2" runat="server">
    </dxcb:ASPxCallback>
    <dx:XpoDataSource ID="HOIzinXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[NoIzin] Is Not Null">
    </dx:XpoDataSource>
    
    <dxpc:ASPxPopupControl ID="DataHOASPxPopupControl" runat="Server" ClientInstanceName="HOpopup"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Daftar Ulang" Width="250px">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <dxwgv:ASPxGridView ID="GridHOIzin" runat="server" DataSourceID="HOIzinXpoDataSource"
                    AutoGenerateColumns="False" KeyFieldName="HOID" ClientInstanceName="GridIzin"
                    Width="250px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="HOID" ReadOnly="True" Visible="False" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="NoIzin" Caption="Nomor Izin" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="NamaPerusahaan" Caption="Nama Perusahaan"
                            VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn FieldName="JenisUsahaID!Key" Caption="Jenis Usaha"
                            VisibleIndex="2">
                            <PropertiesComboBox DataSourceID="JenisUsahaHOXpoDataSource" TextField="JenisUsaha"
                                ValueField="JenisUsahaID" ValueType="System.String">
                            </PropertiesComboBox>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="LokasiUsaha" Caption="Alamat Perusahaan"
                            VisibleIndex="3">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="NamaPemilik" Caption="Nama Pemilik" VisibleIndex="4">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="AlamatPemilik" Caption="Alamat Pemilik"
                            VisibleIndex="5">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
                <dxe:ASPxButton ID="GridButton" runat="Server" Text="Pilih">
                </dxe:ASPxButton>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="NomorIzinASPxPopupControl" runat="server" ClientInstanceName="NomorIzinPopup"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan" ShowCloseButton="true" Width="300px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <table width="100%">
                    <tr>
                        <td align="center">
                            Nomor Izin Tidak Ditemukan !!!
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Tutup" AutoPostBack="false"
                                AllowFocus="false">
                                <ClientSideEvents Click="function(s, e)
                            {
                                NomorIzinPopup.HideWindow();
                            }" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="syaratIzinASPxPopupControl" runat="server" ClientInstanceName="syaratIzinPopup"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan" ShowCloseButton="true" Width="300px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <table width="100%">
                    <tr>
                        <td align="center">
                            Syarat Izin Tidak Lengkap !!!
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <dxe:ASPxButton ID="closeASPxButton" runat="server" Text="Tutup" AutoPostBack="false"
                                AllowFocus="false">
                                <ClientSideEvents Click="function(s, e)
                            {
                                syaratIzinPopup.HideWindow();
                            }" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="permohonanASPxPopupControl" runat="server" ClientInstanceName="permohonanPopup"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan" ShowCloseButton="true" Width="300px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <table width="100%">
                    <tr>
                        <td align="center">
                            Permohonan sudah disimpan
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <dxe:ASPxButton ID="permohonanASPxButton" runat="server" Text="Tutup" AutoPostBack="false"
                                AllowFocus="false">
                                <ClientSideEvents Click="function(s, e)
                            {
                                permohonanPopup.HideWindow();
                            }" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="IzinPopup" runat="server" ClientInstanceName="IzinPopup"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan" ShowCloseButton="true" Width="300px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <table width="100%">
                    <tr>
                        <td align="center">
                            Izin harus dipilih !!!
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Tutup" AutoPostBack="false"
                                AllowFocus="false">
                                <ClientSideEvents Click="function(s, e)
                            {
                                IzinPopup.HideWindow();
                            }" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    
    <h1>
        Permohonan
    </h1>
    <table width="760">
        <tr>
            <td align="right" valign="top" style="width: 110px;">
                Pilihan Jenis Izin :
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="imbASPxCheckBox" runat="server" Text="IMB">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="imbASPxComboBox" runat="server" DataSourceID="imbXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    ValueType="System.String">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){syaratIzinGridView.PerformCallback();}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <dxcb:ASPxCallback ID="ASPxCallback3" runat="server">
                                <ClientSideEvents BeginCallback="function(s,e){
                                imbIzinLamaLabel.SetVisible(true);}" />
                            </dxcb:ASPxCallback>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxLabel ID="imbIzinLamaASPxLabel" runat="server" Text="Nomor Izin Lama : "
                                    ClientInstanceName="imbIzinLamaLabel" Visible="false">
                                </dxe:ASPxLabel>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="imbIzinLamaASPxTextBox" runat="server" Width="170px" Visible="false"
                                    ClientInstanceName="imbIzinLamaTextBox">
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="lokasiASPxCheckBox" runat="server" Text="Izin Lokasi">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="lokasiASPxComboBox" runat="server" DataSourceID="lokasiXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    AutoPostBack="false">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){syaratIzinGridView.PerformCallback();}" />
                                </dxe:ASPxComboBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="iuiASPxCheckBox" runat="server" Text="IUI">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="iuiASPxComboBox" runat="server" DataSourceID="iuiXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    AutoPostBack="true">
                                </dxe:ASPxComboBox>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxLabel ID="iuiLamaASPxLabel" runat="server" Text="Nomor Izin Lama : " Visible="false">
                                </dxe:ASPxLabel>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="iuiLamaASPxTextBox" runat="server" Width="170px" Visible="false">
                                    <%--<ValidationSettings ValidationGroup="permohonan">
                                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                                    </ValidationSettings>--%>
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="iptASPxCheckBox" runat="server" Text="IPT">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="iptASPxComboBox" runat="server" DataSourceID="iptXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    AutoPostBack="true">
                                </dxe:ASPxComboBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxLabel ID="IPTLamaASPxLabel" runat="server" Text="Nomor Izin Lama : " Visible="false">
                                </dxe:ASPxLabel>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="IPTLamaASPxTextBox" runat="server" Width="170px" Visible="false">
                                    <%--<ValidationSettings ValidationGroup="permohonan">
                                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                    </tr>--%> 
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="ipiASPxCheckBox" runat="server" Text="IPI">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="IPIASPxComboBox" runat="server" DataSourceID="ipiXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    AutoPostBack="true">
                                </dxe:ASPxComboBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxLabel ID="IPILamaASPxLabel" runat="server" Text="Nomor Izin Lama : " Visible="false">
                                </dxe:ASPxLabel>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="IPILamaASPxTextBox" runat="server" Width="170px" Visible="false">
                                    <%--<ValidationSettings ValidationGroup="permohonan">
                                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                                    </ValidationSettings>--%>
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxLabel ID="TDILamaASPxLabel" runat="server" Text="Nomor Izin Lama : " Visible="false">
                                </dxe:ASPxLabel>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="TDILamaASPxTextBox" runat="server" Width="170px" Visible="false">
                                    <%--<ValidationSettings ValidationGroup="permohonan">
                                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                                    </ValidationSettings>--%>
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="tdiASPxCheckBox" runat="server" Text="TDI">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="TDIASPxComboBox" runat="server" DataSourceID="TDIXpoDataSource"
                                    TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                    AutoPostBack="true">
                                </dxe:ASPxComboBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="hoASPxCheckBox" runat="server" Text="HO">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <ajax:UpdatePanel ID="hoUpdatePanel" runat="Server">
                                <ContentTemplate>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxComboBox ID="hoASPxComboBox" runat="server" DataSourceID="hoXpoDataSource"
                                            TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" ValueField="JenisPermohonanIzinID"
                                            AutoPostBack="true">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e){syaratIzinGridView.PerformCallback();}" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <%--<div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxButton ID="hoASPxButtonLama" runat="Server" Visible="false">
                                            <ClientSideEvents Click="function(s,e){
                                                HOpopup.ShowWindow();
                                            }" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxTextBox ID="hoASPxTextBoxIzinLama" runat="server" Width="170px" Visible="false"
                                            NullText="No Izin Lama" ClientInstanceName="hoIzinLamaTextBox">
                                        </dxe:ASPxTextBox>
                                    </div>--%>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxButton ID="hoASPxButtonIzinLama" runat="Server" Text="Cari Nomor Izin Lama"
                                            Visible="false">
                                            <ClientSideEvents Click="function(s,e){
                                                HOpopup.ShowWindow();
                                            }" />
                                        </dxe:ASPxButton>
                                    </div>
                                </ContentTemplate>
                            </ajax:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="siupASPxCheckBox" runat="server" Text="SIUP">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <ajax:UpdatePanel ID="updatepanel1" runat="server">
                                <ContentTemplate>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxComboBox ID="siupJenisASPxComboBox" runat="server" DataSourceID="SIUPJenisXpoDataSource"
                                            ValueField="JenisIzinID" TextField="JenisIzinNama" AutoPostBack="true">
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxComboBox ID="siupASPxComboBox" runat="server" ClientInstanceName="siupComboBox"
                                            DataSourceID="siupXpoDataSource" ValueField="JenisPermohonanIzinID" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                                            AutoPostBack="true">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e){syaratIzinGridView.PerformCallback();}" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <%--<div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxLabel ID="siupIzinLamaASPxLabel" runat="server" Text="Nomor Izin Lama : "
                                            Visible="false">
                                        </dxe:ASPxLabel>
                                    </div>--%>
                                    <div style="float: left; margin-left: 5px;">
                                        <dxe:ASPxTextBox ID="siupIzinLamaASPxTextBox" runat="server" Width="170px" Visible="false"
                                            ClientInstanceName="siupIzinLamaTextBox" NullText="Nomor Izin Lama">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </ContentTemplate>
                            </ajax:UpdatePanel>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            <div style="float: left;">
                                <dxe:ASPxCheckBox ID="tdpASPxCheckBox" runat="server" Text="TDP">
                                </dxe:ASPxCheckBox>
                            </div>
                        </td>
                        <td>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="tdpJenisASPxComboBox" runat="server" DataSourceID="tdpJenisXpoDataSource"
                                    ValueField="JenisIzinID" TextField="JenisIzinNama" AutoPostBack="true">
                                </dxe:ASPxComboBox>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxComboBox ID="tdpASPxComboBox" runat="server" ClientInstanceName="tdpComboBox"
                                    DataSourceID="siupXpoDataSource" ValueField="JenisPermohonanIzinID" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                                    AutoPostBack="true">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){syaratIzinGridView.PerformCallback();}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <div style="float: left; margin-left: 5px;">
                                <dxe:ASPxTextBox ID="tdpIzinLamaASPxTextBox" runat="server" Width="170px" Visible="false"
                                    ClientInstanceName="tdpIzinLamaTextBox" NullText="Nomor Izin Lama">
                                </dxe:ASPxTextBox>
                            </div>
                        </td>
                    </tr>--%>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                Tanggal Permohonan :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="tanggalPermohonanASPxDateEdit" runat="server" Width="170px"
                    DisplayFormatString="dd MMMM yyyy">
                    <ValidationSettings ValidationGroup="permohonan">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                </dxe:ASPxDateEdit>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                Tanggal Daftar :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="tanggalDaftarASPxDateEdit" runat="server" Width="170px" DisplayFormatString="dd MMMM yyyy">
                    <ValidationSettings ValidationGroup="Daftar">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                </dxe:ASPxDateEdit>
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                Nomor KTP :
            </td>
            <td>
                <dxe:ASPxTextBox ID="nikPemohonASPxTextBox" runat="server" Width="170px" MaxLength="16">
                    <ValidationSettings ValidationGroup="permohonan">
                    </ValidationSettings>
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Nama Pemohon :
            </td>
            <td>
                <dxe:ASPxTextBox ID="namaPemohonASPxTextBox" runat="server" Width="200px">
                    <ValidationSettings ValidationGroup="permohonan">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Tempat Lahir :
            </td>
            <td>
                <div style="float: left;">
                    <dxe:ASPxTextBox ID="tempatLahirPemohonASPxTextBox" runat="server" Width="170px">
                    </dxe:ASPxTextBox>
                </div>
                <div style="float: left;">
                    Tgl Lahir :
                </div>
                <div style="float: left; color:Black;">
                    <dxe:ASPxDateEdit ID="tanggalLahirPemohonASPxDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
                Alamat Pemohon :
            </td>
            <td>
                <div style="float: left;">
                    <dxe:ASPxMemo ID="alamatPemohonASPxTextBox" runat="server" Width="250px" Height="100px">
                        <ValidationSettings ValidationGroup="permohonan">
                            <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                            </ErrorFrameStyle>
                            <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                        </ValidationSettings>
                    </dxe:ASPxMemo>
                </div>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                RT :
            </td>
            <td>
                <div style="float: left; margin-left: 3px">
                    <dxe:ASPxTextBox ID="rtPemohonASPxTextBox" runat="server" Width="30px" MaxLength="2">
                    </dxe:ASPxTextBox>
                </div>
                <div style="float: left; margin-left: 10px">
                    RW :
                </div>
                <div style="float: left; margin-left: 3px">
                    <dxe:ASPxTextBox ID="rwPemohonASPxTextBox" runat="server" Width="30px" MaxLength="2">
                    </dxe:ASPxTextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
                Kabupaten :
            </td>
            <td>
                <dxe:ASPxComboBox ID="kabupatenASPxComboBox" runat="server" DataSourceID="kabupatenXpoDataSource"
                    TextField="KabupatenNama" ValueField="KabupatenID" ValueType="System.String">
                    <ValidationSettings ValidationGroup="permohonan">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                    <ClientSideEvents SelectedIndexChanged="function(s, e)
                {
                    kecamatanComboBox.PerformCallback();
                }" />
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Kecamatan :
            </td>
            <td>
                <dxe:ASPxComboBox ID="kecamatanASPxComboBox" runat="server" ClientInstanceName="kecamatanComboBox"
                    DataSourceID="kecamatanXpoDataSource" TextField="KecamatanNama" ValueField="KecamatanID"
                    ValueType="System.String">
                    <ValidationSettings ValidationGroup="permohonan">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                    <ClientSideEvents SelectedIndexChanged="function(s, e)
                {
                    kelurahanComboBox.PerformCallback(kecamatanComboBox.GetValue());
                }" />
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Kelurahan :
            </td>
            <td>
                <dxe:ASPxComboBox ID="kelurahanASPxComboBox" runat="server" ClientInstanceName="kelurahanComboBox"
                    DataSourceID="kelurahanXpoDataSource" TextField="KelurahanNama" ValueField="KelurahanID"
                    ValueType="System.String">
                    <ValidationSettings ValidationGroup="permohonan">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                </dxe:ASPxComboBox>
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                Kode Pos :
            </td>
            <td>
                <dxe:ASPxTextBox ID="kodePosPemohonASPxTextBox" runat="server" Width="60px" MaxLength="5">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Telepon :
            </td>
            <td>
                <dxe:ASPxTextBox ID="teleponPemohonASPxTextBox" runat="server" Width="170px" MaxLength="13">
                    <%--<MaskSettings Mask="9999999999999" />--%>
                    <ValidationSettings ValidationGroup="permohonan">
                    </ValidationSettings>
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                FAX :
            </td>
            <td>
                <dxe:ASPxTextBox ID="faxPemohonASPxTextBox" runat="server" Width="170px">
                    <%--MaskSettings Mask="9999999999999" />--%>
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Pekerjaan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="pekerjaanPemohonASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Organisasi :
            </td>
            <td>
                <dxe:ASPxTextBox ID="organisasiPemohonASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Jabatan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="jabatanPemohonASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                Keterangan :
            </td>
            <td>
                <dxe:ASPxMemo ID="keteranganASPxTextBox" runat="server" Width="200px" Rows="3">
                </dxe:ASPxMemo>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                Tanggal Input :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="tanggalInputASPxDateEdit" runat="server" Width="170px" DisplayFormatString="dd MMMM yyyy">
                    <ValidationSettings ValidationGroup="Input">
                        <ErrorFrameStyle BackColor="yellow" Font-Bold="true">
                        </ErrorFrameStyle>
                        <RequiredField IsRequired="true" ErrorText="Harus di isi" />
                    </ValidationSettings>
                </dxe:ASPxDateEdit>
            </td>
        </tr>--%>
    </table>
    <dxwgv:ASPxGridView ID="syaratIzinASPxGridView" runat="server" ClientInstanceName="syaratIzinGridView"
        DataSourceID="syaratIzinXpoDataSource" KeyFieldName="SyaratIzinID" AutoGenerateColumns="False"
        Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="100px">
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Syarat" FieldName="MasterDataSyaratID!Key">
                <PropertiesComboBox DataSourceID="masterDataSyaratXpoDataSource" TextField="MasterDataSyaratNama"
                    ValueField="MasterDataSyaratID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <ClientSideEvents Init="function(s, e)
        {
            syaratIzinGridView.UnselectRows();
        }" />
    </dxwgv:ASPxGridView>
    <table>
        <tr>
            <td colspan="2">
                <dxe:ASPxButton ID="saveASPxButton" runat="server" Text="Simpan" ValidationGroup="permohonan"
                    CausesValidation="true">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
