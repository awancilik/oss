<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPTRetribusi.aspx.vb" Inherits="Utility_Izin_IPT_IPTRetribusi" Title="IPT Retribusi" %>

<%@ Reference VirtualPath="~/report/reportPage/IPT/SKRDIPT.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <%--<dx:XpoDataSource ID="IPTXpoDataSource" runat="Server" TypeName="BisnisObjek.OSS.IPT">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" SessionField="IPTID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>--%>
    <dx:XpoDataSource ID="IPTXpoDataSource" runat="Server" TypeName="BisnisObjek.OSS.IPT" Criteria="[PermohonanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControlClose" runat="server">
                <center>
                    Data IPT tidak ditemukan
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
    <dxpc:ASPxPopupControl ID="PopupControlDataDisimpan" runat="server" HeaderText="Peringatan" ClientInstanceName="DataSimpan" Modal="true" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl" runat="Server">
                <center>
                    Data Retribusi IPT telah Disimpan
                    <dxe:ASPxButton ID="simpanASpxButton" runat="server" Text="Ya">
                        <ClientSideEvents Click="function(s,e)
                        {
                          DataSimpan.HideWindow();
                        }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h3>
        Pembayaran Retribusi IPT
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
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="iptRetribusiDetailView" runat="Server" DataKeyNames="IPTID"
        GridLines="None" CssClass="dataprop" AutoGenerateRows="False" DefaultMode="Edit"
        DataSourceID="IPTXpoDataSource">
        <Fields>
            <asp:TemplateField HeaderText="Harga/M&amp;#178">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="ASPxHargaPermeterLabel" runat="Server" Text='<%#Bind("PerMeter") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerMeterTextBox" runat="Server" Width="170px" Text='<%#Bind("PerMeter") %>' OnTextChanged="PerMeterTextBox_TextChanged">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah">
                <ItemTemplate>
                   <dxe:ASPxLabel ID="LuasTanahLabel" runat="Server" Text='<%#Bind("LuasTanah") %>'>
                   </dxe:ASPxLabel>
                </ItemTemplate>
              <EditItemTemplate>
                    <%--<asp:hiddenfield id="hiddenretribusiterbilang" runat="server" value='<%#bind("retribusiterbilang") %>' />--%>
                    <dxe:ASPxTextBox id="LuasTanahTextBox" runat="server" readonly="true" width="170px" Text='<%#Bind("LuasTanah") %>'>
                    </dxe:ASPxTextBox>
               </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah Total">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="ASPxTextBoxJumlahTotal" runat="Server" ReadOnly="true" Width="170px" Text='<%#Bind("Retribusi") %>'>
                    </dxe:ASPxTextBox>
               </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>     
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float:left;">
                        <dxe:ASPxButton ID="ASPxButtonUpdate" runat="Server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                    <%--<div style="float:left;">
                        <dxe:ASPxButton ID="ASPxButtonCetakSKRD" runat="Server" Text="Cetak SKRD IPT" CommandName="Update" OnClick="cetakSKRDIPTASPxButton_Click">
                        </dxe:ASPxButton>
                    </div>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
