<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDIBAP.aspx.vb" Inherits="Utility_Izin_TDI_TDIBAP" Title="TDI BAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="font-family: Fantasy; font-size: xx-large; color: White;">
        <dxe:ASPxLabel ID="LabelTDIBAP" runat="server" Text="TDI BAP">
        </dxe:ASPxLabel>
    </div>
    <dx:XpoDataSource ID="BAPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDIBAP"
        Criteria="[TDIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparamter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxcb:ASPxCallback ID="coba" runat="server" ClientSideEvents-BeginCallback="function(s,e){TidakDitemukanPopupControl.ShowWindow();}">
    </dxcb:ASPxCallback>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Not Found !">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Nomor Permohonan tidak Ditemukan !
                    <br />
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TidakDitemukanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukan nomor permohonan :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari" AutoPostBack="false">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <asp:DetailsView ID="BAPDetailView" runat="server" Visible="true" AutoGenerateRows="False"
        DataSourceID="BAPXpoDataSource" CssClass="dataprop" GridLines="None" DataKeyNames="TDIBAPID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Nomer BAP : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("TDIBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("TDIBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomerBAPASPxLabel" runat="server" Text='<%# Eval("TDIBAPNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("TDIBAPTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("TDIBAPTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalBAPASPxLabel" runat="server" Text='<%# Eval("TDIBAPTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Catatan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("TDIBAPCatatan") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("TDIBAPCatatan") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="catatanASPxLabel" runat="server" Text='<%# Eval("TDIBAPCatatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekomendasi : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("TDIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("TDIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="rekomendasiASPxTextBox" runat="server" Text='<%# Eval("TDIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="insertASPxButton" runat="server" Text="Simpan" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="cancelASPxButton" runat="server" Text="Batal" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>
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
                <ItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Ganti" CommandName="Edit">
                        </dxe:ASPxButton>
                    </div>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
