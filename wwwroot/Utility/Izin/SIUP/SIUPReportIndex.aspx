<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="SIUPReportIndex.aspx.vb" Inherits="Utility_Izin_SIUP_SIUPReportIndex" title="SIUP Report Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        SIUP Report Index
    </h1>
    <div class="main_menu">
     <%--<div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/SIUP/SIUPretribusiBulanan.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan SIUP" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Retribusi Bulanan SIUP</span>
                    <span class="ket_text">
                        Berfungsi untuk Melihat Retribusi bulanan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>--%>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/SIUP/Keputusan2.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Surat Keputusan SIUP</span>
                        <span class="ket_text">
                            Berfungsi untuk penerbitan Izin Perluasan Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        
        <%--<div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/SIUP/SKRD.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">SKRD</span>
                        <span class="ket_text">
                            Berfungsi untuk penerbitan Surat Ketetapan Retribusi Daerah Izin Perluasan Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>--%>
    </div>
</asp:Content>

