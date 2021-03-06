<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDPReportIndex.aspx.vb" Inherits="Utility_Izin_TDP_TDPReportIndex"
    Title="TDP Report Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        TDP Report Index
    </h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/TDP/Sertifikat.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan TDP" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Sertifikat TDP</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Sertifikiat Izin Perluasan Usaha Industri<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/TDP/Petikan.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan TDP" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan TDP</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Perluasan Usaha Industri<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/TDP/Keputusan.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Surat Keputusan TDP</span>
                        <span class="ket_text">
                            Berfungsi untuk penerbitan Izin Perluasan Usaha Industri<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/TDP/SKRD.aspx">
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
        </div>
    </div>
</asp:Content>
