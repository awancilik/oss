<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPT.aspx.vb" Inherits="Utility_Izin_IPT_IPT" Title="IPT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="IPTXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPT"
        Criteria="[IPTID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPTID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PemohonXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <dxcb:ASPxCallback ID="KecamatanASPxCallback" runat="Server" ClientInstanceName="KecamatanCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="KelurahanASPxCallback" runat="Server" ClientInstanceName="KeluarahanCallback">
    </dxcb:ASPxCallback>
    <%--<script language="javascript" type="text/javascript">
        function kecamatanberubah(kecamatanpemilikaspxcombobox)
        {
            kelurahanpemilikaspxcombobox.performcallback(kecamatanpemilikaspxcombobox.GetValue().toString());
        }
    </script>--%>
    <%--   <dxe:ASPxDateEdit ID="ASPxDateEditTanggalTerdaftar" ClientInstanceName="ASPxDateTanggalTerdaftar" runat="Server">
    </dxe:ASPxDateEdit>--%>
    <b style="font-size: xx-large">
        <dxe:ASPxLabel ID="LabelASP" runat="server" Text="Izin IPT">
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
                <dxe:ASPxButton ID="NoPermohonanButton" runat="server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Peringatan!!" ClientInstanceName="ASPxPopupControl1"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Maaf, Nomor Permohonan Anda Tidak Terdaftar di Izin IPT<br />
                    <dxe:ASPxButton ID="OKButton" AutoPostBack="false" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s, e){ASPxPopupControl1.HideWindow();} " />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="PopupKosongTexBox" HeaderText="Peringatan!" ClientInstanceName="PopupPeringatanTextBox"
        runat="server" Modal="true" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter"
        Width="450px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlTextBox" runat="server">
                <center>
                    Maaf, Tolong Diisi Nomor Permohonan Anda<br />
                    <dxe:ASPxButton ID="OK" AutoPostBack="false" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s,e){PopupPeringatanTextBox.HideWindow();} " />
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
                    Maaf, Nomor Permohonan Sudah Terdaftar di Izin IPT<br />
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
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <center>
                    Maaf, Nomor Permohonan Anda Sudah Tidak Terdaftar di Izin IPT<br />
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
            <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <center>
                    Data Telah Tersimpan !<br />
                    <dxe:ASPxButton ID="TersimpanButton" ClientInstanceName="TersimpanButton" runat="server"
                        Text="OK">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <%--Batas--%>
    <asp:DetailsView ID="IPTDetailsView" AutoGenerateRows="False" runat="server" DataSourceID="IPTXpoDataSource"
        CssClass="dataprop" GridLines="None" DataKeyNames="IPTID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="DATA PEMILIK">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NamaLabelTextBox" Width="170px" runat="server" Text='<%#Bind("NamaPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikTextBox" Width="170px" runat="server" Text='<%#Bind("NamaPemilik") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="AlamatPemilikLabel" Width="170px" runat="server" Text='<%#Bind("AlamatPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPemilikMemo" Width="170px" Height="71px" runat="Server" Text='<%#Bind("AlamatPemilik") %>'>
                    </dxe:ASPxMemo>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Letak Tanah">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="LetakTanahLabel" runat="Server" Text='<%#Bind("LetakTanah") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LetakTanahTextBox" runat="Server" Width="170px" Text='<%#Bind("LetakTanah") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Peruntukan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PeruntukanTextBox" runat="server" Width="170px" Text='<%#Bind("Peruntukan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RT">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PemilikRTLabel" runat="Server" Width="170px" Text='<%#Bind("PemilikRT") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikRTTextBox" runat="server" Width="170px" Text='<%#Bind("PemilikRT") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RW">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PemilikRWLabel" runat="server" Width="170px" Text='<%#Bind("PemilikRW") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikRWTextBox" runat="Server" Width="170px" Text='<%#Bind("PemilikRW") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kabupaten ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="KabupatenPemilikLabel" runat="server" Text="KUDUS">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="pemilikKecamatanASPxComboBox" runat="server" DropDownStyle="DropDownList"
                        EnableIncrementalFiltering="true" ClientInstanceName="pemilikKecamatanComboBox"
                        DataSourceID="KecamatanXpoDataSource" TextField="KecamatanNama" ValueField="KecamatanID"
                        ValueType="System.String" EnableSynchronization="False" Visible="true">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            pemilikKelurahanComboBox.PerformCallback(pemilikKecamatanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KelurahanPemilikComboBox" ClientInstanceName="pemilikKelurahanComboBox"
                        DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID" TextField="KelurahanNama"
                        runat="server" ValueType="System.String" Visible="true" OnCallback="KelurahanASPxCallback_Callback">
                        <ClientSideEvents LostFocus="function(s, e)
                        {
                            KeluarahanCallback.PerformCallback(pemilikKelurahanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah (M&#178;)">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="LuasTanahLabel" Width="170px" runat="server" Text='<%#Eval("LuasTanah") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasTanahTextBox" Width="170px" runat="server" Text='<%#Bind("LuasTanah") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Persil :">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PersilNomorLabel" runat="Server" Text='<%#Bind("PersilNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NomorPersilTextBox" runat="Server" Width="170px" Text='<%#Bind("PersilNomor") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sertifikat ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="SertifikatLabel" runat="Server" Text='<%#Bind("Sertifikat") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="SertifikatTextBox" Width="170px" runat="Server" Text='<%#Bind("Sertifikat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Leter C/D">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NomorLeterLabel" runat="Server" Text='<%#Bind("NomorLeterC_D") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NomorLetterCDTextBox" runat="Server" Width="170px" Text='<%#Bind("NomorLeterC_D") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelas">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="KelasLabel" runat="Server" Width="170px" Text='<%#Bind("Kelas") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KelasTextBox" runat="Server" Width="170px" Text='<%#Bind("Kelas") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Utara ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasUtaraLabel" runat="server" Text='<%#Bind("BatasUtara") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="BatasUtaraTxtBox" runat="Server" Width="170px" Text='<%#Bind("BatasUtara") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Selatan ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasSelatanLabel" runat="server" Text='<%#Bind("BatasSelatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="BatasSelatanTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasSelatan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Timur ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasTimurLabel" runat="server" Width="170px" Text='<%#Bind("BatasTimur") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="BatasTimurTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasTimur") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Barat">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasBatatLabel" runat="Server" Text='<%#Bind("BatasBarat") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="BatasBaratTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasBarat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
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
                <%--<InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="SaveButton" Text="Save" runat="server" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>--%>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
