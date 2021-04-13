<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HODaftarUlang.aspx.vb" Inherits="Utility_Izin_HO_HODaftarUlang" Title="HO Daftar Ulang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="HOXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisUsahaDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisUsaha">
    </dx:XpoDataSource>
    <dxcb:ASPxCallback ID="CallbackJenis" runat="Server" ClientInstanceName="JenisCallback"
        OnCallback="CallbackJenis_Callback">
    </dxcb:ASPxCallback>
    <h1>
        Daftar Ulang
    </h1>
    <asp:DetailsView ID="DaftUlangHO" runat="Server" DataSourceID="HOXpoDataSource" DataKeyNames="HOID"
        CssClass="dataprop" GridLines="none" AutoGenerateRows="False" DefaultMode="insert">
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
        <Fields>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPerTextBox" runat="Server" Width="170px" Text='<%#Bind("NamaPerusahaan") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Usaha">
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="JenisComboBox" runat="Server" ClientInstanceName="JenisCombo"
                        DataSourceID="JenisUsahaDataSource" ValueField="JenisUsahaID" TextField="JenisUsaha"
                        ValueType="System.String" EnableCallbackMode="True" OnCallback="CallbackJenis_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s,e){
                                JenisCallback.PerformCallback(JenisCombo.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan">
                <InsertItemTemplate>
                    <dxe:ASPxMemo ID="AlamatMemo" runat="Server" Width="170px" Height="50px" Text='<%#Bind("AlamatPemilik") %>'>
                    </dxe:ASPxMemo>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor dan Tgl Izin Gangguan/HO">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="NomorTglHO" runat="Server" Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Pemilik Perusahaan">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikTextBox" runat="Server" Text='<%#Bind("NamaPemilik") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pengusaha">
                <InsertItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPengusahaTextBox" runat="Server" Width="170px" Height="50px"
                        Text='<%#Bind("LetakPerusahaan") %>'>
                    </dxe:ASPxMemo>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Masa berlakunya Izin 
Daftar Ulang">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="MasaBerlakuDaftarUlangLabel" runat="Server" Text='<%#Bind("MasaBerlakuDafUlang") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lain - lain">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="LainTextBox" runat="Server" Width="170px" Text='<%#Bind("LainLain") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="ButtonSimpan" runat="Server" CommandName="Insert" Text="Simpan">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
