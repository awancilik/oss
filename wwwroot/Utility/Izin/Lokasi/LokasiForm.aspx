<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiForm.aspx.vb" Inherits="Utility_Izin_LokasiForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="LokasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Lokasi"
        Criteria="[LokasiID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PemohonXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="KecamatanLokasiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.tanah">
    </dx:XpoDataSource>
    <dxcb:ASPxCallback ID="dummyASPxCallback" ClientInstanceName="dummyASPxCallback"
        runat="server">
    </dxcb:ASPxCallback>
    <dxe:ASPxComboBox ID="ASPxComboBox1" ClientInstanceName="ASPxComboBox1" runat="server"
        Visible="false">
    </dxe:ASPxComboBox>
    <dxe:ASPxDateEdit ID="ASPxDateEdit1" ClientInstanceName="ASPxDateEdit1" runat="server"
        Visible="false">
        <ClientSideEvents DateChanged="function(s, e){
    dummyASPxCallback.PerformCallback(ASPxDateEdit1.GetText());
    }" />
    </dxe:ASPxDateEdit>
    <b style="font-size: xx-large">
        <dxe:ASPxLabel ID="LabelASP" runat="server" Text="Izin Lokasi">
        </dxe:ASPxLabel>
    </b>
    <table>
        <tr>
            <td>
                No Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanTextBox" Width="170px" runat="server">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="NoPermohonanButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="ASPxPopupControl1"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Maaf, Nomor Permohonan Anda Tidak Terdaftar di Izin Lokasi<br />
                    <dxe:ASPxButton ID="OKButton" AutoPostBack="false" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s, e){ASPxPopupControl1.HideWindow();} " />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TelahTerdaftarPopupControl" ClientInstanceName="TelahTerdaftarPopupControl"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Maaf, Nomor Permohonan Sudah Terdaftar di Izin Lokasi<br />
                    <dxe:ASPxButton ID="ASPxButton3" AutoPostBack="false" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s, e){TelahTerdaftarPopupControl.HideWindow();} " />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControl2" ClientInstanceName="ASPxPopupControl2"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Maaf, Nomor Permohonan Anda Sudah Tidak Terdaftar di Izin Lokasi<br />
                    <dxe:ASPxButton ID="ASPxButton1" AutoPostBack="false" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s, e){ASPxPopupControl2.HideWindow();} " />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TersimpanPopupControl" ClientInstanceName="TersimpanPopupControl"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px" HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Data Telah Tersimpan !<br />
                    <dxe:ASPxButton ID="TersimpanButton" ClientInstanceName="TersimpanButton" runat="server"
                        Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <%--Batas--%>
    <asp:DetailsView ID="LokasiDetailsView" AutoGenerateRows="False" runat="server" DataSourceID="LokasiXpoDataSource"
        CssClass="dataprop" GridLines="None" DataKeyNames="LokasiID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Nama Pemilik : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NamaPemilikLabel" Width="170px" runat="server" Text='<%#Eval("NamaPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikTextBox" Width="170px" runat="server" Text='<%#Bind("NamaPemilik") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Badan Usaha : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="JenisBadanUsahaLabel" Width="170px" runat="server" Text='<%#Eval("JenisUsaha") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JenisBadanUsahaTextBox" Width="170px" runat="server" Text='<%#Bind("JenisUsaha") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Badan Usaha : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NamaBadanUsahaLabel" Width="170px" runat="server" Text='<%#Eval("NamaBadanUsaha") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaBadanUsahaTextBox" Width="170px" runat="server" Text='<%#Bind("NamaBadanUsaha") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="AlamatPemilikLabel" Width="170px" runat="server" Text='<%#Eval("AlamatPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AlamatPemilikTextBox" Width="170px" runat="server" Text='<%#Bind("AlamatPemilik") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pemilik Kecamatan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PemilikKecamatanLokasiLabel" ClientInstanceName="KecamatanLokasiLabel"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxComboBox DataSourceID="KecamatanXpoDataSource" ValueField="KecamatanID"
                        TextField="KecamatanNama" ID="PemilikKecamatanLokasiComboBox" ClientInstanceName="PemilikKecamatanLokasiComboBox"
                        Width="170px" runat="server">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            PemilikKelurahanComboBox.PerformCallback(PemilikKecamatanLokasiComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pemilik Kelurahan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PemilikKelurahanLokasiLabel" ClientInstanceName="KelurahanLokasiLabel"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxComboBox DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID"
                        TextField="KelurahanNama" ID="PemilikKelurahanLokasiComboBox" ClientInstanceName="PemilikKelurahanComboBox"
                        Width="170px" runat="server" OnCallback="PemilikKelurahanLokasiComboBox_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            PemilikKelurahanCallback.PerformCallback(PemilikKelurahanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="PemilikKelurahanCallback" runat="server" ClientInstanceName="PemilikKelurahanCallback" OnCallback="PemilikKelurahanCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telp Pemilik : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="TelpLabel" Width="170px" runat="server" Text='<%#Eval("PemilikTelpon") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TelpTextBox" Width="170px" runat="server" Text='<%#Bind("PemilikTelpon") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax Pemilik : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="FaxLabel" Width="170px" runat="server" Text='<%#Eval("PemilikFax") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="FaxTextBox" Width="170px" runat="server" Text='<%#Bind("PemilikFax") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Akte Pendirian : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="AkteLabel" Width="170px" runat="server" Text='<%#Eval("AktePendirian") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AkteTextBox" Width="170px" runat="server" Text='<%#Bind("AktePendirian") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPWP : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NPWPLabel" Width="170px" runat="server" Text='<%#Eval("NPWP") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWPTextBox" Width="170px" runat="server" Text='<%#Bind("NPWP") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="LuasLabel" Width="170px" runat="server" Text='<%#Eval("Luas") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasTextBox" Width="170px" runat="server" Text='<%#Bind("Luas") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kabupaten Lokasi : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="KabupatenLokasiLabel" ClientInstanceName="KabupatenLokasiLabel"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="KabupatenLokasiLabel" ClientInstanceName="KabupatenLokasiLabel"
                        runat="server" Text="Kudus">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan Lokasi : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="KecamatanLokasiLabel" ClientInstanceName="KecamatanLokasiLabel"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxComboBox DataSourceID="KecamatanXpoDataSource" ValueField="KecamatanID"
                        TextField="KecamatanNama" ID="KecamatanLokasiComboBox" ClientInstanceName="KecamatanLokasiComboBox"
                        Width="170px" runat="server">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            KelurahanComboBox.PerformCallback(KecamatanLokasiComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan Lokasi : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="KelurahanLokasiLabel" ClientInstanceName="KelurahanLokasiLabel"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxComboBox DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID"
                        TextField="KelurahanNama" ID="KelurahanLokasiComboBox" ClientInstanceName="KelurahanComboBox"
                        Width="170px" runat="server" OnCallback="KelurahanLokasiComboBox_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            KelurahanCallback.PerformCallback(KelurahanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="KelurahanCallback" runat="server" ClientInstanceName="KelurahanCallback"
                        OnCallback="KelurahanLokasiCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="StatusLabel" ClientInstanceName="StatusLabel" Width="170px" runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxComboBox DataSourceID="StatusXpoDataSource" ValueField="StatusTanahID" TextField="StatusTanah"
                        ID="StatusComboBox" Width="170px" runat="server" ClientInstanceName="StatusComboBox">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            StatusCallback.PerformCallback(StatusComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                    <dxcb:ASPxCallback ID="StatusCallback" runat="server" ClientInstanceName="StatusCallback"
                        OnCallback="StatusCallback_Callback">
                    </dxcb:ASPxCallback>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Penggunaan Sekarang : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PenggunaanLabel" Width="170px" runat="server" Text='<%#Eval("PenggunaanSekarang") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PenggunaanTextBox" Width="170px" runat="server" Text='<%#Bind("PenggunaanSekarang") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PerusahaanNamaLabel" Width="170px" runat="server" Text='<%#Eval("PerusahaanNama") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanNamaTextBox" Width="170px" runat="server" Text='<%#Bind("PerusahaanNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PerusahaanAlamatLabel" Width="170px" runat="server" Text='<%#Eval("PerusahaanAlamat") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanAlamatTextBox" Width="170px" runat="server" Text='<%#Bind("PerusahaanAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telpon Perusahaan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PerusahaanTelponLabel" Width="170px" runat="server" Text='<%#Eval("PerusahaanTelpon") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanTelponTextBox" Width="170px" runat="server" Text='<%#Bind("PerusahaanTelpon") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax Perusahaan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PerusahaanFaxLabel" Width="170px" runat="server" Text='<%#Eval("PerusahaanFax") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanFaxTextBox" Width="170px" runat="server" Text='<%#Bind("PerusahaanFax") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Terbit : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="TanggalLabel" ClientInstanceName="TanggalLabel" Width="170px"
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TanggalDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy"
                        Date='<%#Bind("TanggalTerbit") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tujuan Izin : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="TujuanLabel" Width="170px" runat="server" Text='<%#Eval("Tujuan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TujuanTextBox" Width="170px" runat="server" Text='<%#Bind("Tujuan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Izin : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NomorIzinLabel" Width="170px" runat="server" Text='<%#Eval("NoIzin") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <dxe:ASPxTextBox ID="NomorIzinTextBox" Width="170px" runat="server" Text='<%#Bind("NoIzin") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>--%>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Input">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglinputASPxDateEdit" runat="server" ClientInstanceName="TglIzinLamaDateEdit"
                        DisplayFormatString="dd MMMM yyyy" Date='<%#Bind("TglInput") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%-- <div style="float: left">
                        <dxe:ASPxButton ID="NewButton" Text="New" runat="server" CommandName="New">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left">
                        <dxe:ASPxButton ID="EditButton" Text="Edit" runat="server" CommandName="Edit">
                        </dxe:ASPxButton>
                    </div>--%>
                </ItemTemplate>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="SaveButton" Text="Save" runat="server" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
