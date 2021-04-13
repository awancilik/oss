<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HoRetribusi2.aspx.vb" Inherits="Utility_Izin_HO_HoRetribusi2" Title="HO Retribusi" %>

<%@ Reference VirtualPath="~/report/reportPage/HO/HOSKRD.aspx" %>
<%@ Reference VirtualPath="~/report/reportPage/HO/SKRDDaftarUlangHO.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="XpoDataSourceHO" runat="Server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HORetribusiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HORetribusi"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisTarifLingkunganXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOTaripLingkungan"
        Criteria="[JenisTaripLingkungan] <> 'Indeks Lokasi' And [JenisTaripLingkungan] <> 'Indeks Gangguan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TarifLingkunganXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOJenisLingkungan"
        Criteria="[HOTaripJenisID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOTaripJenisID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TarifXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOJenisLingkungan"
        Criteria="[HOJenisLingkunganID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOJenisLingkunganID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisLokasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOIndeksLokasi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksLokasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOIndeksLokasi"
        Criteria="[HOIndeksLokasiID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOIndeksLokasiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisGangguanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOIndeksGangguan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksGangguanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOIndeksGangguan"
        Criteria="[HOIndeksGangguanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOIndeksGangguanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PopupSimpanASPx" runat="server" ClientInstanceName="PopupSimpan"
        PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="Server">
                <center>
                    Data Telah Tersimpan!!
                    <dxe:ASPxButton ID="ButtonSimpan" runat="server" Text="Ya">
                        <ClientSideEvents Click="function(s,e){
                        PopupSimpan.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlUpdate" runat="server" ClientInstanceName="PopupUpdate"
        PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="Server">
                <center>
                    Data Telah Disimpan!!
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Ya">
                        <ClientSideEvents Click="function(s,e){
                        PopupUpdate.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlKosong" runat="server" ClientInstanceName="PopupKosong"
        PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="Server">
                <center>
                    Maaf Data Yang Anda Cari Tidak Ada!!
                    <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Ya">
                        <ClientSideEvents Click="function(s,e){
                        PopupKosong.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukan Nomor Permohonan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxe:ASPxComboBox ID="Comboboxdumi" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <asp:DetailsView ID="HORetriDetailsView" runat="Server" AutoGenerateRows="false"
        CssClass="dataprop" DataSourceID="HORetribusiXpoDataSource" DataKeyNames="HORetribusiID"
        GridLines="none">
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
        <Fields>
            <asp:TemplateField HeaderText="Jatuh Tempo">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglPembayaranASPxDateEdit" runat="server" Date='<%#Bind("TglPembayaran") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas">
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="LuasASPxLabel" runat="server" Text='<%#Eval("LuasUsaha")%>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Tarif Lingkungan">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="JTarifLingkunganASPxComboBox" runat="server" ClientInstanceName="JTarifLingkunganComboBox"
                        DataSourceID="JenisTarifLingkunganXpoDataSource" ValueField="HOTaripLingkunganID"
                        TextField="JenisTaripLingkungan">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){
                            JenisLingkunganComboBox.PerformCallback(JTarifLingkunganComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Lingkungan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="JenisLingkunganASPxCombobox" runat="server" ClientInstanceName="JenisLingkunganComboBox"
                        DataSourceID="TarifLingkunganXpoDataSource" ValueField="HOJenisLingkunganID"
                        TextField="JenisLingkungan" OnCallback="JenisLingkunganComboBox_Callback" ClientSideEvents-EndCallback="function(s, e){
                            TarifComboBox.PerformCallback(JenisLingkunganComboBox.GetText());
                        }" DisplayFormatString="c0">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){
                            TarifComboBox.PerformCallback(JenisLingkunganComboBox.GetText());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tarif">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="TarifASPxCombobox" runat="server" ClientInstanceName="TarifComboBox"
                        DataSourceID="TarifXpoDataSource" ValueField="HOJenisLingkunganID" TextField="Tarif"
                        OnCallback="TarifASPxComboBox_Callback">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Untuk Indeks Lokasi">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Indeks">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="JenisIndeksASPxLabel" runat="server" Text="Indeks Lokasi" Font-Bold="true">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Lokasi">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="JenisLokasiASPxComboBox" runat="server" ClientInstanceName="JenisLokasiComboBox"
                        DataSourceID="JenisLokasiXpoDataSource" ValueField="HOIndeksLokasiID" TextField="JenisLokasi">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){IndeksLokasiComboBox.PerformCallback(JenisLokasiComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Indeks Lokasi">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="IndeksLokasiASPxComboBox" runat="server" ClientInstanceName="IndeksLokasiComboBox"
                        DataSourceID="IndeksLokasiXpoDataSource" ValueField="HOIndeksLokasiID" TextField="Indeks"
                        OnCallback="IndeksLokasiComboBox_Callback">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Untuk Indeks Gangguan">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Indeks">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="JenisIndeksASPxLabel2" runat="server" Text="Indeks Gangguan">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Gangguan  ">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="JenisGangguanASPxComboBox" runat="server" ClientInstanceName="JenisGangguanComboBox"
                        DataSourceID="JenisGangguanXpoDataSource" ValueField="HOIndeksGangguanID" TextField="JenisGangguan">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){IndeksGangguanComboBox.PerformCallback(JenisGangguanComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Indeks Gangguan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="IndeksGangguanASPxComboBox" runat="server" ClientInstanceName="IndeksGangguanComboBox"
                        DataSourceID="IndeksGangguanXpoDataSource" ValueField="HOIndeksGangguanID" TextField="Indeks"
                        OnCallback="IndeksGangguanComboBox_Callback">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CetakButton" runat="Server" Text="Cetak SKRD" OnClick="CetakSKRD_Click">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    
    <asp:DetailsView ID="DafUlangDetailsView" runat="Server" AutoGenerateRows="false"
        CssClass="dataprop" DataSourceID="XpoDataSourceHO" DataKeyNames="HOID" GridLines="none">
        <Fields>
            <asp:TemplateField HeaderText="Tanggal Pembayaran Daftar Ulang">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglBayarASPxDateEdit" runat="Server" DisplayFormatString="dd MMMM yyyy"
                        Date='<%#Bind("TglDftrUlang") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retribusi">
                <%--<ItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetribusi" runat="Server" Width="170px" Text='<%#Eval("Retribusi") %>'>
                    </dxe:ASPxTextBox>
                </ItemTemplate>--%>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetribusiEdit" runat="Server" Width="170px" Text='<%#Eval("Retribusi") %>'
                        DisplayFormatString="c2">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retribusi Daftar Ulang (50% x RIG(HO))">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetriDaftarUlangEdit" runat="server" Width="170px" Text='<%#Bind("RetriDaftarUlang") %>'
                        OnTextChanged="TextBoxRetriDaftarUlang_TextChanged" ReadOnly="True">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cetak">
                <ItemTemplate>
                    <dxe:ASPxButton ID="CetakButton" runat="Server" Text="Cetak SKRD Daftar Ulang" OnClick="CetakButton_Click" />
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <%--<InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="InsertASPxButton" runat="server" Text="Simpan" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="cancelASPxButton" runat="server" Text="Batal" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>--%>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="cancelASPxButton" runat="server" Text="Batal" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
