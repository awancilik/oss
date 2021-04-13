<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiRetribusi.aspx.vb" Inherits="Utility_Izin_LokasiRetribusi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="LokasiRetribusiDetailsXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiRetribusi"
        Criteria="[LokasiRetribusiID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="new" SessionField="RetribusiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HDPPTXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.viewHDPPT">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiIP">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IUXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiIU">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PeringatanPopupControl" runat="server" Modal="true" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ClientInstanceName="PeringatanPopupControl"
        HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server" Width="250px">
                <center>
                    Maaf, Nomor Permohonan tidak ditemukan !
                    <dxe:ASPxButton ID="OkButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){PeringatanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <div style="float: left">
        <dxe:ASPxButton ID="BuatRetribusiButton" runat="server" Text="Buat Retribusi" AutoPostBack="false">
        </dxe:ASPxButton>
    </div>
    <div style="float: left">
        <dxe:ASPxButton ID="EditRetribusiButton" runat="server" Text="Edit Retribusi">
        </dxe:ASPxButton>
    </div>
    <br />
    <dxp:ASPxPanel ID="BuatRetribusiPanel" ClientInstanceName="BuatRetribusiPanel" runat="server"
        Width="200px" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <table>
                    <tr>
                        <td>
                            Cari Nomor Permohonan</td>
                        <td>
                            :</td>
                        <td>
                            <dxe:ASPxTextBox ID="NoPermohonanTextBox" runat="server" Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="NoPermohonanLokasiButton" runat="server" Text="Buat">
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <dxp:ASPxPanel ID="EditRetribusiPanel" ClientInstanceName="EditRetribusiPanel" runat="server"
        Width="200px" Visible="false">
        <PanelCollection>
            <dxp:PanelContent ID="PanelContent1" runat="server">
                <table>
                    <tr>
                        <td>
                            Cari Nomor Permohonan</td>
                        <td>
                            :</td>
                        <td>
                            <dxe:ASPxTextBox ID="noPermohononanEditTextBox" runat="server" Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="NoPermohonanEditButton" runat="server" Text="Edit">
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <b>
        <asp:Label ID="PeringatanLabel" runat="server" Visible="false"></asp:Label></b>
    <asp:DetailsView ID="RetribusiDetailView" runat="server" DataSourceID="LokasiRetribusiDetailsXpoDataSource"
        AutoGenerateRows="False" CssClass="dataprop" GridLines="None" DataKeyNames="LokasiRetribusiID"
        Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Peruntukan HDPPT: ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="PeruntukanTLabel" Width="170px" Text='<%#Bind ("HDPPTPeruntukan") %>'
                        runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxcb:ASPxCallback ID="PeruntukanCallback" runat="server" ClientInstanceName="PeruntukanCallback"
                        OnCallback="PeruntukanCallback_CallBack">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxComboBox ID="PeruntukanComboBox" ClientInstanceName="PeruntukanComboBox"
                        runat="server">
                        <Items>
                            <dxe:ListEditItem Text="Industri" Value="Industri" />
                            <dxe:ListEditItem Text="Pertokoan" Value="Pertokoan" />
                            <dxe:ListEditItem Text="Perumahan" Value="Perumahan" />
                            <dxe:ListEditItem Text="Pertanian" Value="Pertanian" />
                        </Items>
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                        PeruntukanCallback.PerformCallback(PeruntukanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="PeruntukanComboBox" runat="server">
                        <Items>
                            <dxe:ListEditItem Text="Industri" Value="Industri" />
                            <dxe:ListEditItem Text="Pertokoan" Value="Pertokoan" />
                            <dxe:ListEditItem Text="Perumahan" Value="Perumahan" />
                            <dxe:ListEditItem Text="Pertanian" Value="Pertanian" />
                        </Items>
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis HDPPT : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="JenisLabel" Width="170px" Text='<%#Bind ("HDPPTJenis") %>' runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxcb:ASPxCallback ID="JenisCallback" runat="server" ClientInstanceName="JenisCallback"
                        OnCallback="JenisCallback_CallBack">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxComboBox ID="JenisComboBox" ClientInstanceName="JenisComboBox" runat="server">
                        <Items>
                            <dxe:ListEditItem Text="Besar" Value="Besar" />
                            <dxe:ListEditItem Text="Sedang" Value="Sedang" />
                            <dxe:ListEditItem Text="Kecil" Value="Kecil" />
                        </Items>
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                        JenisCallback.PerformCallback(JenisComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="JenisComboBox" runat="server">
                        <Items>
                            <dxe:ListEditItem Text="Besar" Value="Besar" />
                            <dxe:ListEditItem Text="Sedang" Value="Sedang" />
                            <dxe:ListEditItem Text="Kecil" Value="Kecil" />
                        </Items>
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Indeks Peruntukan Tanah : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="IPLabel" Width="250px" runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxcb:ASPxCallback ID="IPCallback" runat="server" ClientInstanceName="IPCallback"
                        OnCallback="IPCallback_CallBack">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxComboBox ID="IPComboBox" ClientInstanceName="IPComboBox" runat="server"
                        DataSourceID="IPXpoDataSource" ValueField="LokasiIP_" TextField="IPTanah" Width="250px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                        IPCallback.PerformCallback(IPComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="IPComboBox" runat="server" DataSourceID="IPXpoDataSource" ValueField="LokasiIP_"
                        TextField="IPTanah" Width="250px">
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Indeks Usaha : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="IULabel" Width="250px" runat="server">
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxcb:ASPxCallback ID="IUCallback" runat="server" ClientInstanceName="IUCallback"
                        OnCallback="IUCallback_CallBack">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxComboBox ID="IUComboBox" ClientInstanceName="IUComboBox" runat="server"
                        DataSourceID="IUXpoDataSource" ValueField="LokasiIU_" TextField="Jenis" Width="250px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                        IUCallback.PerformCallback(IUComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="IUComboBox" runat="server" DataSourceID="IUXpoDataSource" ValueField="LokasiIU_"
                        TextField="Jenis" Width="250px">
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="TanahLabel" Width="250px" runat="server" Text='<%#Bind("Luas") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TanahTextBox" runat="server" Width="170px" Text='<%#Bind("Luas") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="TanahTextBox" runat="server" Width="170px" Text='<%#Bind("Luas") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah Retribusi :">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="RetribusiLabel" Width="250px" runat="server" Text='<%#Bind("Retribusi") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
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
