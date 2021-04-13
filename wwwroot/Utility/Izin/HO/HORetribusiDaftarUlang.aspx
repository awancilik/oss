<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HORetribusiDaftarUlang.aspx.vb" Inherits="Utility_Izin_HO_HORetribusiDaftarUlang"
    Title="HO Retribusi Daftar Ulang" %>
    
<%@ Reference VirtualPath="~/report/reportPage/HO/SKRDDaftarUlangHO.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="XpoDataSourceHO" runat="Server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PopupSimpan" runat="Server" HeaderText="Konfirmasi" ClientInstanceName="PopupTersimpan"
        Modal="true" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopuSimpan" runat="Server">
                <center>
                    Data Tersimpan!!
                    <dxe:ASPxButton ID="ButtonSimpan" runat="server" Text="Ya">
                        <ClientSideEvents Click="function(s,e){
                    PopupTersimpan.HideWindow();
                }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h3>
        Pembayaran Retribusi Daftar Ulang HO
    </h3>
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
            <td>
                <dxe:ASPxButton ID="CetakButtonUlang" runat="Server" Text="Cetak Retribusi Daftar Ulang" />
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="HORetriDetailsView" runat="Server" AutoGenerateRows="false"
        CssClass="dataprop" DataSourceID="XpoDataSourceHO" DataKeyNames="HOID" GridLines="none">
        <Fields>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="InsertASPxButton" runat="server" Text="Simpan" CommandName="Insert">
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
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayaran Daftar Ulang">
                <ItemStyle CssClass="field" />
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="TglBayarASPxDateEdit" runat="Server" DisplayFormatString="dd MMMM yyyy"
                        Date='<%#Bind("TglDftrUlang") %>'>
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglBayarASPxDateEdit" runat="Server" DisplayFormatString="dd MMMM yyyy"
                        Date='<%#Bind("TglDftrUlang") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retribusi">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetribusi" runat="Server" Width="170px" Text='<%#Bind("Retribusi") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetribusiEdit" runat="Server" Width="170px" Text='<%#Bind("Retribusi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retribusi Daftar Ulang (50% x RIG(HO))">
                <%--<InsertItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetriDaftarUlang" runat="server" Width="170px" Text='<%#Bind("RetriDaftarUlang") %>' OnTextChanged="TextBoxRetriDaftarUlang_TextChanged">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>--%>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TextBoxRetriDaftarUlangEdit" runat="server" Width="170px" Text='<%#Bind("RetriDaftarUlang") %>'
                        OnTextChanged="TextBoxRetriDaftarUlang_TextChanged">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
