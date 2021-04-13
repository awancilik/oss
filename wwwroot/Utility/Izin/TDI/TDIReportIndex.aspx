<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDIReportIndex.aspx.vb" Inherits="Utility_Izin_TDI_TDIReportIndex"
    Title="TDI Report Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        TDI Report Index
    </h1>
    <div class="main_menu">
        <div class="clearfix container">
           <%-- <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/TDI/Petikan.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan TDI</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Perluasan Usaha Industri<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>--%>
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/TDI/Keputusan.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Keputusan</span>
                        <span class="ket_text">
                            Berfungsi untuk penerbitan Surat Keputusan <br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/TDI/DaftarBulanan.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Daftar Bulanan TDI</span>
                        <span class="ket_text">
                            Berfungsi untuk Melihat Daftar Bulanan Izin Perluasan Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
