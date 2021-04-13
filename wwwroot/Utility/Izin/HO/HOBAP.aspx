<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HOBAP.aspx.vb" Inherits="Utility_Izin_HO_HOBAP" Title="HO BAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="HOXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TimTeknisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOTimTeknis">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="BAPDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOBAPDetail"
        Criteria="[HOBAPID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="BAPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PopupPeringatan" runat="server" Modal="true" PopupVerticalAlign="windowCenter"
        PopupHorizontalAlign="windowCenter" ClientInstanceName="PopupPeringatan" HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="Popup" runat="Server">
                <center>
                    Data Berhasil Disimpan!!
                    <dxe:ASPxButton ID="OkButton" runat="Server" Text="Ya" ClientInstanceName="OkButton">
                        <ClientSideEvents Click="function(s,e){
                        PopupPeringatan.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukan nomor permohonan
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
    <asp:DetailsView ID="HODetailsView" runat="server" DataSourceID="HOXpoDataSource"
        DataKeyNames="HOID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false"
        Visible="false">
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
        <Fields>
            <asp:TemplateField HeaderText="Nama">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="NamaASPxLabel" runat="server" Text='<%#Eval("NamaPemilik") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="AlamatASPxLabel" runat="server" Text='<%#Eval("AlamatPemilik") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="NamaPerusahaanASPxLabel" runat="server" Text='<%#Eval("NamaPerusahaan") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Usaha">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="JenisUsahaASPxLabel" runat="server">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lokasi Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="LokasiPerusahaanASPxLabel" runat="server" Text='<%#Eval("LokasiUsaha") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Input">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglASPxDateEdit" runat="Server" Date='<%#Bind("TglInput") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah Tenaga Kerja">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JmlTenagaKerjASPxTextBox" runat="Server" Text='<%#Bind("JmlTenagaKerja") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Saran">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="MenuASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Name="New" Text="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Edit" Text="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Delete" Text="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                            if(e.item.name=='New'){
                                SaranGridView.AddNewRow();
                            }else{
                                if(e.item.name=='Edit'){
                                    SaranGridView.StartEditRow(SaranGridView.GetFocusedRowIndex());
                                }else{
                                    SaranGridView.DeleteRow(SaranGridView.GetFocusedRowIndex());
                                }                             
                            }
                        }" />
                    </dxm:ASPxMenu>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxwgv:ASPxGridView ID="SaranASPxGridView" runat="server" ClientInstanceName="SaranGridView"
                        DataSourceID="BAPDetailXpoDataSource" KeyFieldName="HOBAPDetailID" AutoGenerateColumns="False"
                        Width="100%" OnRowInserting="BAP_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="HOBAPDetailID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="HOBAPID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption=" " FieldName="TimTeknis!Key" VisibleIndex="0"
                                Width="200px" GroupIndex="0" Visible="true">
                                <PropertiesComboBox DataSourceID="TimTeknisXpoDataSource" ValueField="HOTimTeknisID"
                                    TextField="TimTeknis" Width="200px">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataMemoColumn Caption="Saran" FieldName="Saran" VisibleIndex="3">
                            </dxwgv:GridViewDataMemoColumn>
                        </Columns>
                        <SettingsBehavior AutoExpandAllGroups="True" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="true" PopupEditFormVerticalAlign="WindowCenter"
                            PopupEditFormHorizontalAlign="windowCenter" PopupEditFormWidth="500px" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kesimpulan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="KesimpulanASPxMemo" runat="server" Width="100%" Height="100px">
                    </dxe:ASPxMemo>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <div style="float: left">
                        <dxe:ASPxButton ID="saveButton" runat="server" Text="Save" CommandName="update">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left">
                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Batal" CommandName="cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
