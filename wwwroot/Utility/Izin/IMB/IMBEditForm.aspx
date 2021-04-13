<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IMBEditForm.aspx.vb" Inherits="Utility_Izin_IMBEditForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="imbXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMB"
        Criteria="[IMBID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IMBID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="imbLantaiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBlantai"
        Criteria="[IMBID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IMBID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
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
    <dx:XpoDataSource ID="PerusahaanKecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan"
        Criteria="[KecamatanKabupatenID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PerusahaanKabupatenID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PerusahaanKelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PerusahaanKecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="lokasiKecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan"
        Criteria="[KecamatanKabupatenID]='8bd7afe5-db64-49f1-bd2d-fe1a0daef868'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="lokasiKelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiKecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TujuanIMBXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBtujuan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PelaksanaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBpelaksana">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusTanahXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.tanah">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisBangunanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBbangunan">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data IMB tidak ditemukan
                    <dxe:ASPxButton ID="closeASPxButton" runat="server" Text="Tutup">
                        <ClientSideEvents Click="function(s, e)
                    {
                        notFoundPopup.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TersimpanPopupControl" ClientInstanceName="TersimpanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Data Telah Di Simpan !
                    <br />
                    <dxe:ASPxButton ID="OkButton" ClientInstanceName="OkButton" runat="server" Text="Selesai"
                        AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e)
                {
                TersimpanPopupControl.HideWindow();
                }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h1>
        Data IMB</h1>
    <table>
        <tr>
            <td>
                Masukkan Nomer Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="searchNomerPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="imbDetailsView" runat="server" DataSourceID="imbXpoDataSource"
        DataKeyNames="IMBID" AutoGenerateRows="False" CssClass="dataprop" GridLines="None">
        <Fields>
            <asp:TemplateField HeaderText="Data Pemilik">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No KTP : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikNoKTPTextBox" runat="server" Width="170px" Text='<%# Bind("NoKTP") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Pemilik : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikNamaTextBox" runat="server" Width="170px" Text='<%# Bind("Nama") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik : ">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="PemilikAlamatMemo" runat="Server" Width="200px" Height="100px" Text='<%#Bind("Alamat") %>' NullText="-">
                    </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="PemilikAlamatTextBox" runat="server" Width="170px" Text='<%# Bind("Alamat") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telepon : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikTelponTextBox" runat="server" Width="170px" Text='<%# Bind("Telp") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FAX : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikFaxTextBox" runat="server" Width="170px" Text='<%# Bind("Fax") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tujuan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="PemilikMaksudComboBox" runat="server" ClientInstanceName="tujuanComboBox"
                        ValueField="TujuanID" TextField="TujuanIMB" ValueType="System.String" DataSourceID="TujuanIMBXpoDataSource">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            tujuanCallback.PerformCallback(tujuanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="tujuanASPxCallBack" runat="server" ClientInstanceName="tujuanCallback"
                        OnCallback="tujuanASPxCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pelaksana : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="PemilikPelaksanaComboBox" runat="server" ClientInstanceName="pelaksanaComboBox"
                        ValueField="PelaksanaID" TextField="Pelaksana" ValueType="System.String" DataSourceID="PelaksanaXpoDataSource">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            pelaksanaCallback.PerformCallback(pelaksanaComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="pelaksanaASPxCallback" runat="server" ClientInstanceName="pelaksanaCallback"
                        OnCallback="pelaksanaASPxCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data Perusahaan">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="namaPerusahaanASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PerusahaanNama") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan : ">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="alamatPerusahaanASPxMemo" runat="Server" Width="200px" Height="100px"
                     Text='<%#Bind("PerusahaanAlamat") %>' NullText="-" AutoResizeWithContainer="True">
                     </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="alamatPerusahaanASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PerusahaanAlamat") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telepon : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="telpPerusahaanASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PerusahaanTelepon") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="faxPerusahaanASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PerusahaanFax") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data Bangunan">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lokasi Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="bLokasiBangunanMemo" runat="Server" Height="100px" Width="200px"
                     Text='<%#Bind("lksAlamat") %>' NullText="-" AutoResizeWithContainer="true">
                    </dxe:ASPxMemo>
                   <%-- <dxe:ASPxTextBox ID="bLokasiBangunanTextBox" runat="server" Height="15px" Width="170px"
                        Text='<%# Bind("lksAlamat") %>' NullText="-">
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
           <%-- <asp:TemplateField HeaderText="RT : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bRTTextBox" runat="server" Width="170px" MaxLength="2" Size="2"
                        Text='<%# Bind("lksRT") %>' NullText="-">
                        <ValidationSettings>
                            <RegularExpression ErrorText="RT harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RW : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bRWTextBox" runat="server" Width="170px" MaxLength="2" Size="2"
                        Text='<%# Bind("lksRW") %>' NullText="-">
                        <ValidationSettings>
                            <RegularExpression ErrorText="RW harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Kabupaten : ">
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="kabASPxLabel" runat="server" Text="KUDUS">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="lokasiKecamatanASPxComboBox" runat="server" ClientInstanceName="lokasiKecamatanComboBox"
                        DataSourceID="lokasiKecamatanXpoDataSource" TextField="KecamatanNama" ValueField="KecamatanID"
                        ValueType="System.String">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            lokasiKelurahanComboBox.PerformCallback(lokasiKecamatanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="bKelurahanLokasiComboBox" ClientInstanceName="lokasiKelurahanComboBox"
                        DataSourceID="lokasiKelurahanXpoDataSource" ValueField="KelurahanID" TextField="KelurahanNama"
                        runat="server" ValueType="System.String" OnCallback="lokasiKelurahanASPxComboBox_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            lokasiKelurahanCallback.PerformCallback(lokasiKelurahanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="lokasiKelurahanASPxCallback" runat="server" ClientInstanceName="lokasiKelurahanCallback"
                        OnCallback="lokasiKelurahanASPxCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kode Pos : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bKodeposTextBox" runat="server" Width="170px" MaxLength="5"
                        Size="5" Text='<%# Bind("lksKodePos") %>' NullText="-">
                        <ValidationSettings>
                            <RegularExpression ErrorText="Kode Pos harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Propinsi : ">
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="propASPxLabel" runat="server" Text="JAWA TENGAH">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No Sertifikat : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bNoSertifikatTextBox" runat="server" Width="170px" Text='<%# Bind("NoSertifikat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pemilik Sertifikat : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bPemilikSertifikatTextBox" runat="server" Width="170px" Text='<%# Bind("PmlkSertifikat") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bLuasTanahTextBox" runat="server" Width="170px" Text='<%# Bind("Luas") %>'>
                        <ValidationSettings>
                            <RegularExpression ErrorText="Luas tanah harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status Tanah : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="bStatusTanahComboBox" ClientInstanceName="statusTanahComboBox"
                        DataSourceID="StatusTanahXpoDataSource" ValueField="StatusTanahID" TextField="StatusTanah"
                        runat="server" ValueType="System.String">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            statusTanahCallback.PerformCallback(statusTanahComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="statusTanahASPxCallback" runat="server" ClientInstanceName="statusTanahCallback"
                        OnCallback="statusTanahASPxCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="bLuasBangunanTextBox" runat="server" Width="170px" Text='<%# Bind("LuasBangunan") %>'>
                        <ValidationSettings>
                            <RegularExpression ErrorText="Luas bangunan harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="bJenisBangunanComboBox" ClientInstanceName="jenisBangunanComboBox"
                        DataSourceID="JenisBangunanXpoDataSource" ValueField="JenisBangunanID" TextField="JenisBangunan"
                        runat="server" ValueType="System.String" Width="268px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            jenisBangunanCallback.PerformCallback(jenisBangunanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="jenisBangunanAPSxCallback" runat="server" ClientInstanceName="jenisBangunanCallback"
                        OnCallback="jenisBangunanASPxCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Sarana Bangunan">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fungsi Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbFungsiBangunanTextBox" runat="server" Height="21px" Width="268px"
                        Text='<%# Bind("FungsiBangunan") %>' NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Garis Sempadan Pagar : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbGSPTextBox" runat="server" Height="21px" Width="266px" Text='<%# Bind("GSP") %>'>
                        <ValidationSettings>
                            <RegularExpression ErrorText="GSP harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Garis Sempadan Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbGSBTextBox" runat="server" Height="21px" Width="266px" Text='<%# Bind("GSB") %>'>
                        <ValidationSettings>
                            <RegularExpression ErrorText="GSB harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Koefisien Dasar Bangunan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbKDPTextBox" runat="server" Height="21px" Width="268px" Text='<%# Bind("KDB") %>'>
                       <%--<ValidationSettings>
                            <RegularExpression ErrorText="KDB harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Jarak dari sumbu jalan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbJarakDariSumbuJalanTextBox" runat="server" Height="21px" Width="50px"
                        Text='<%# Bind("Jarak") %>'>
                        <ValidationSettings>
                            <RegularExpression ErrorText="Jarak harus diisi angka(0-9)" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="dari jalan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="sbDariJalanTextBox" runat="server" Width="320px" Text='<%# Bind("NamaJalan") %>'
                        NullText="-">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Bangunan Tambahan : ">
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="ASPxMenu1" runat="server">
                        <Items>
                            <dxm:MenuItem Name="New" Text="Tambah">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Edit" Text="Ganti">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Delete" Text="Hapus">
                            </dxm:MenuItem>
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
                    </dxm:ASPxMenu>
                    <br />
                    <dxwgv:ASPxGridView ID="BangunanTambahanASPxGridView" runat="server" AutoGenerateColumns="False"
                        ClientInstanceName="BangunanTambahanGridView" DataSourceID="IMBLantaiXpoDataSource"
                        KeyFieldName="IMBlantaiID" Width="100%" OnRowInserting="BangunanTambahanASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="True" AllowSort="false" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Lantai" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Luas" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="true"
                            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                        <SettingsText CommandUpdate="Simpan" CommandCancel="Batal" PopupEditFormCaption="Tambah Lantai" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField>
                <EditItemTemplate>
                    <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                    </dxe:ASPxButton>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
    </asp:DetailsView>
</asp:Content>
